extends Node

onready var menu = $Menu
onready var dialog = $Dialog

var game_is_started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	if Input.is_action_just_pressed("mouse_right") and game_is_started:
		menu.visible = !menu.visible

func _on_NewGame_button_down():
	if !game_is_started:
		game_is_started = true
		
	menu.visible = false
	menu.enableResumeButton()
	menu.enableSave()
	
	dialog.visible = true
