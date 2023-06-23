extends MarginContainer

@onready var retry = %Retry
@onready var main_menu = %MainMenu


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
	get_tree().reload_current_scene()
	
func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
