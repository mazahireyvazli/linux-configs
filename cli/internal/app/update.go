package app

import (
	tea "github.com/charmbracelet/bubbletea"
)

func (m AppModel) UpdateView(view View) (tea.Model, tea.Cmd) {
	m.currentView = view

	return m, nil
}

func (m AppModel) GoToInstallView() (tea.Model, tea.Cmd) {
	chosenRows := m.GetChosenRows()

	if len(chosenRows) > 0 {
		return m.UpdateView(INSTALL_VIEW)
	}

	return m, nil
}

func (m AppModel) UpdateChosenRowIndexes() (tea.Model, tea.Cmd) {
	cursorIndex := m.table.Cursor()

	if cursorIndex != -1 {
		m.chosens[cursorIndex] = !m.chosens[cursorIndex]
	}

	currentRows := m.table.Rows()

	for i := range currentRows {
		if m.chosens[i] {
			currentRows[i][0] = chosenStr
		} else {
			currentRows[i][0] = notChosenStr
		}
	}

	m.table.SetRows(currentRows)

	return m, nil
}
