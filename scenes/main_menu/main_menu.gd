extends Control

@onready var play = %Play
@onready var exit = %Exit
@onready var node_2d = $Node2D

func _ready():
	play.pressed.connect(_on_play_pressed)	
	exit.pressed.connect(_on_exit_pressed)

func _on_play_pressed():
	var control_levels = get_tree().get_first_node_in_group("control")
	control_levels.initiate_level("")
	node_2d.get_node("ParallaxBackground").hide_parallax()
	
func _on_exit_pressed():
	get_tree().quit()
