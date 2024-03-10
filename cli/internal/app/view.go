package app

import (
	"strings"

	"github.com/charmbracelet/bubbles/table"
	"github.com/charmbracelet/lipgloss"
)

const NEW_LINE = "\n"
const DOUBLE_NEW_LINE = NEW_LINE + NEW_LINE

var (
	baseTableStyle = lipgloss.NewStyle().
			BorderStyle(lipgloss.NormalBorder()).
			BorderForeground(lipgloss.Color("240"))

	baseStyle  = lipgloss.NewStyle()
	titleStyle = lipgloss.NewStyle().
			Bold(true).
			Foreground(lipgloss.Color("#FAFAFA")).
			Background(lipgloss.Color("#7A56F4"))
)

var (
	chosenStr    = "[x]"
	notChosenStr = "[ ]"
)

var rows = []table.Row{
	{notChosenStr, "Git", "Version control system", "2.43.0"},
	{notChosenStr, "Oh my ZSH", "ZSH configuration manager", "5.8.1"},
}

var columns = []table.Column{
	{Title: "[ ]", Width: 3},
	{Title: "Name", Width: 10},
	{Title: "Description", Width: 20},
	{Title: "Version", Width: 10},
}

func (m AppModel) RenderChosenRowNames() string {
	chosenRows := m.GetChosenRows()

	if len(chosenRows) == 0 {
		return ""
	}

	chosenRowNames := make([]string, 0)
	for _, row := range m.GetChosenRows() {
		chosenRowNames = append(chosenRowNames, row[1])
	}

	return baseStyle.Render(titleStyle.Render(strings.Join(chosenRowNames, ", ")), "will be installed.", "Press enter to proceed")
}

func (m AppModel) ListHeaderFragment() []string {
	return []string{
		titleStyle.Render("Which packages do you want to install?"),
		baseStyle.Render("Press space to select"),
	}
}

func (m AppModel) ListFooterFragment() []string {
	return []string{
		m.RenderChosenRowNames(),
		baseStyle.Blink(true).Faint(true).Render("Press q to quit"),
	}
}

func (m AppModel) ListView() (v string) {
	v += NEW_LINE

	v += strings.Join(m.ListHeaderFragment(), DOUBLE_NEW_LINE) + NEW_LINE

	v += baseTableStyle.Render(m.table.View()) + NEW_LINE

	v += strings.Join(m.ListFooterFragment(), DOUBLE_NEW_LINE) + NEW_LINE

	return v
}

func (m AppModel) InstallView() (v string) {
	v += NEW_LINE

	v += baseStyle.Render(m.RenderChosenRowNames()) + NEW_LINE

	return v
}
