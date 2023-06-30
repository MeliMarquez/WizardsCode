extends MarginContainer

@onready var resume = %Resume
@onready var retry = %Retry
@onready var main_menu = %MainMenu

@onready var control_levels = get_tree().get_first_node_in_group("control")

func _ready():
	hide()
	resume.pressed.connect(_on_resume_pressed)	
	retry.pressed.connect(_on_retry_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)

func _input(event):
	if event.is_action_pressed("pause"):
		show()
		get_tree().paused = true

func _on_resume_pressed():
	hide()
	get_tree().paused = false
	
func _on_retry_pressed():
	hide()
	get_tree().paused = false
	
	
func _on_main_menu_pressed():
	get_tree().paused = false
	control_levels.initiate_level("main")
