package app

import (
	"github.com/charmbracelet/bubbles/table"
	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"
)

type View string

var (
	LIST_VIEW    View = "LIST_VIEW"
	INSTALL_VIEW View = "INSTALL_VIEW"
)

type AppModel struct {
	table       table.Model
	chosens     map[int]bool
	currentView View
}

func (m AppModel) GetChosenRows() []table.Row {
	rows := m.table.Rows()
	chosenRows := make([]table.Row, 0)

	for i, row := range rows {
		if m.chosens[i] {
			chosenRows = append(chosenRows, row)
		}
	}

	return chosenRows
}

func NewModel() AppModel {
	t := table.New(
		table.WithColumns(columns),
		table.WithRows(rows),
		table.WithFocused(true),
		table.WithHeight(7),
		table.WithStyles(table.Styles{
			Selected: lipgloss.NewStyle().Bold(true).Foreground(lipgloss.Color("#7A56F4")),
			Header:   lipgloss.NewStyle().Bold(true).Padding(0, 1),
			Cell:     lipgloss.NewStyle().Padding(0, 1),
		}),
	)

	return AppModel{
		table:       t,
		chosens:     make(map[int]bool),
		currentView: LIST_VIEW,
	}
}

func (m AppModel) Init() tea.Cmd {
	return nil
}

func (m AppModel) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	var cmd tea.Cmd
	switch msg := msg.(type) {
	case tea.KeyMsg:
		switch msg.String() {
		case "q", tea.KeyCtrlC.String():
			return m, tea.Quit

		case tea.KeySpace.String():
			return m.UpdateChosenRowIndexes()
		case tea.KeyEnter.String():
			return m.GoToInstallView()
		}
	}
	m.table, cmd = m.table.Update(msg)
	return m, cmd
}

func (m AppModel) View() (v string) {
	switch m.currentView {
	case LIST_VIEW:
		v += m.ListView()
	case INSTALL_VIEW:
		v += m.InstallView()
	}

	return v
}
