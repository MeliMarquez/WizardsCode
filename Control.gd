class_name Levels
extends Control

const levels = [
	"res://scenes/levels/level0/level0.tscn",
	"res://scenes/levels/level1/level1.tscn",
	"res://scenes/levels/level2/level2.tscn",
	"res://scenes/levels/level3/level3.tscn"
]

@onready var main_menu = preload("res://scenes/main_menu/main_menu.tscn")

var main_menu_instance
var level
var level_instance
var player 
var retry_var = 0

var enemies = 0
var actual_level = 1

func _ready():
	main_menu_instance = main_menu.instantiate()
	get_parent().add_child.call_deferred(main_menu_instance)
	actual_level = 0

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
