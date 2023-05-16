extends MarginContainer

@onready var normal_spell = %NormalSpell
@onready var if_spell = %IfSpell
@onready var while_spell = %WhileSpell
@onready var for_spell = %ForSpell

@onready var edit_if = %EditIf
@onready var edit_if_menu = $CanvasLayer/EditIfMenu

var SPELL_TYPE = 0
var SUBTYPE = 0

func _ready():
	normal_spell.pressed.connect(_on_normal_spell_pressed)
	if_spell.pressed.connect(_on_if_spell_pressed)
	while_spell.pressed.connect(_on_while_spell_pressed)
	for_spell.pressed.connect(_on_for_spell_pressed)
	
	edit_if.pressed.connect(_on_edit_if_pressed)

	
func _on_normal_spell_pressed():
	self.SPELL_TYPE = 0
	
func _on_if_spell_pressed():
	self.SPELL_TYPE = 1

func _on_while_spell_pressed():
	self.SPELL_TYPE = 2
	
func _on_for_spell_pressed():
	self.SPELL_TYPE = 3
		
func get_spell_type():
	return self.SPELL_TYPE
	

func _on_edit_if_pressed():
	edit_if_menu.show()
	get_tree().paused = true
	#################### ayuda pause tree y obtener subtipo
	if not get_tree().paused:
		self.SUBTYPE = edit_if_menu.get_subtype()
		print("El subtipo es: ", self.SUBTYPE)
	
func get_subtype():
	return self.SUBTYPE
	
