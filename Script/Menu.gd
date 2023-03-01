extends Control

onready var tab_container = $TabContainer
onready var tab_buttons = [$Buttons/Save, $Buttons/Load, $Buttons/Options]

onready var resume_button = $Buttons/Resume

var can_save = false

func setCurrentTab(index:int):
	tab_container.current_tab = index
	for i in range(tab_buttons.size()):
		if i == index:
			tab_buttons[i].disabled = true
		else:
			if i == 0 and !can_save:
				continue
			tab_buttons[i].disabled = false

func _on_Save_pressed():
	tab_container.visible = true
	setCurrentTab(0)

func _on_Load_pressed():
	tab_container.visible = true
	setCurrentTab(1)

func _on_Options_pressed():
	tab_container.visible = true
	setCurrentTab(2)

func enableResumeButton():
	resume_button.disabled = false

func _on_Resume_pressed():
	visible = false

func enableSave():
	can_save = true
	tab_buttons[0].disabled = false

func _on_Quit_button_down():
	get_tree().quit()
