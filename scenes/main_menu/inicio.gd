extends MarginContainer

@onready var play = %Play
@onready var exit = %Exit

# Called when the node enters the scene tree for the first time.
func _ready():
	play.pressed.connect(_on_play_pressed)	
	exit.pressed.connect(_on_exit_pressed)


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/main/primera_escena.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
