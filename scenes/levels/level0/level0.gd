class_name GameLevel
extends Node2D

var label_text = ""
@onready var magic_points = get_node("Player/Resources/MagicPoints")	
@onready var magic_points_sprite = get_node("Player/Resources/Sprite2D3")
@onready var spells_menu = get_node("Menu Spells")
@onready var actual_level = get_node("Player/Resources/Level")	
@onready var actual_level_sprite = get_node("Player/Resources/Sprite2D2")

# Called when the node enters the scene tree for the first time.
func _ready():
	var label = get_node("GameConstants/Tutorial/Label")
	set_text()
	label.set_text(label_text)
	hide_elements()

func hide_elements():
	magic_points.hide()
	magic_points_sprite.hide()
	spells_menu.hide()

func set_text():
	label_text = "Hello World
There you are, Goopert the Wizard!
Can you help us defeating those evil
bats?\n
[Press X to throw a spell]"
