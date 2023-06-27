extends MarginContainer

@onready var next_level_button = %NextLevel
@onready var main_menu = %MainMenu
@onready var control_levels = get_tree().get_first_node_in_group("control")
func _ready():
	hide()
	next_level_button.pressed.connect(_on_next_level_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)

func next_level():
	show()
	get_tree().paused = true
	
func _on_next_level_pressed():
	hide()
	get_tree().paused = false
	control_levels.next_level()
	
	
func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().get_first_node_in_group("control").initiate_level("main")
