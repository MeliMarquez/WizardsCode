extends MarginContainer

@onready var retry = %Retry
@onready var main_menu = %MainMenu

@onready var control_levels = get_tree().get_first_node_in_group("control")

func _ready():
	hide()
	retry.pressed.connect(_on_retry_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)

func lose_level():
	show()
	get_tree().paused = true
	
func _on_retry_pressed():
	hide()
	get_tree().paused = false
	if control_levels.get_level() == 4 or control_levels.get_level() == 7: 
		control_levels.next_level()
	else:
		control_levels.initiate_level("")
	
func _on_main_menu_pressed():
	get_tree().paused = false
	control_levels.initiate_level("main")
