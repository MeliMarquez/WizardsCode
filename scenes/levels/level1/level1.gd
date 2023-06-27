class_name Level
extends Node2D

@onready var player = $"Player"

var enemies = 0
var next_level = "res://scenes/levels/levelx/levelx.tscn"
	

func add_enemie():
	self.enemies+=1
	
func _process(_delta):	
	if self.enemies == 0:
		player.go_to_next_level()

func delete_enemie():
	self.enemies-=1
