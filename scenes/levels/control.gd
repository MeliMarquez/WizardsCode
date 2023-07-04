extends Control

const levels = [
	"res://scenes/levels/level0/level0.tscn",
	"res://scenes/levels/level1/level1.tscn",
	"res://scenes/levels/level2/level2.tscn",
	"res://scenes/levels/level3/level3.tscn",
	"res://scenes/levels/level4/level4.tscn",
	"res://scenes/levels/level5/level5.tscn",
	"res://scenes/levels/level6/level6.tscn",
	"res://scenes/levels/level7/level7.tscn",
	"res://scenes/levels/level8/level8.tscn",
	"res://scenes/levels/level9/level9.tscn",
	"res://scenes/levels/level10/level10.tscn",
	"res://scenes/levels/level11/level11.tscn",
	"res://scenes/levels/level12/level12.tscn",
	"res://scenes/levels/level13/level13.tscn",
	"res://scenes/levels/level14/level14.tscn",
	"res://scenes/levels/level15/level15.tscn",
	"res://scenes/levels/final_level/final_level.tscn",
]

@onready var main_menu = preload("res://scenes/main_menu/main_menu.tscn")
@onready var audio_stream_player_2d = $AudioStreamPlayer3D

var main_menu_instance
var level
var level_instance
var player 
var retry_var = 0

var enemies = 0
var actual_level = 1

func _ready():
	audio_stream_player_2d.play()
	main_menu_instance = main_menu.instantiate()
	get_parent().add_child.call_deferred(main_menu_instance)
	actual_level = 0#8

func add_enemie():
	self.enemies+=1

func delete_enemie():
	self.enemies-=1
	if self.enemies == 0:
		if actual_level < len(levels)-1:
			player.go_to_next_level()
		else:
			player.win()
			
func next_level():
	self.actual_level+=1
	level_instance.queue_free()
	initiate_level("")

	
func initiate_level(main):
	main_menu_instance.hide()
	if retry_var != 0:
		level_instance.queue_free()
	retry_var = 1
	if main != "main":
		self.enemies = 0
		level = load(levels[actual_level])
		level_instance = level.instantiate()
		get_parent().add_child(level_instance)	
		player = level_instance.get_node("Player")
		player.set_level(actual_level)
	else:
		main_menu_instance.show()
		main_menu_instance.get_node("Node2D/ParallaxBackground").show_parallax()
		retry_var = 0

func get_level():
	return self.actual_level
