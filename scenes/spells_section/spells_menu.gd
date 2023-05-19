extends MarginContainer

@onready var normal_spell = %NormalSpell
@onready var if_spell = %IfSpell
@onready var while_spell = %WhileSpell
@onready var for_spell = %ForSpell

@onready var combo_1 = %Combo1
@onready var combo_2 = %Combo2
@onready var combo_3 = %Combo3


@onready var edit_if = %EditIf
@onready var edit_if_menu = %EditIfMenu

@onready var edit_while = %EditWhile
@onready var edit_while_menu = %EditWhileMenu

@onready var edit_for = %EditFor
@onready var edit_for_menu = %EditForMenu


var spell_type = 0				# ALL SPELLS MANAGER: 	 0 Normal - 1 If - 2 While - 3 For
var target_type = 0				# IF SPELL MANAGER:    	 0 Enemy - 1 Not enemy                 ##### 0 Enemy - 1 Enemy 2.0 - 2 Not enemy
var damage = 1					# FOR SPELL MANAGER:   	 Amount of attack's damage
var target_lock = 0				# WHILE SPELL MANAGER: 	 0 Amount of enemys - 1 Amount of life

var combo = false
var combo_number = 0

func _ready():
	normal_spell.pressed.connect(_on_spell_pressed.bind(0))
	if_spell.pressed.connect(_on_spell_pressed.bind(1))
	while_spell.pressed.connect(_on_spell_pressed.bind(2))
	for_spell.pressed.connect(_on_spell_pressed.bind(3))
	
	combo_1.pressed.connect(_on_combo_pressed.bind(0))	
	combo_2.pressed.connect(_on_combo_pressed.bind(1))	
	combo_3.pressed.connect(_on_combo_pressed.bind(2))
	
	edit_if.pressed.connect(_on_edit_pressed.bind(1))
	edit_while.pressed.connect(_on_edit_pressed.bind(2))
	edit_for.pressed.connect(_on_edit_pressed.bind(3))

## ON BUTTONS PRESSED
func _on_spell_pressed(spell_type_input):
	set_combo(false)
	set_type(spell_type_input)

func _on_combo_pressed(combo_number_input):
	set_combo(true)
	set_combo_number(combo_number_input)
			
func _on_edit_pressed(edition_type):
	
	#IF EDITIOM MENU
	if edition_type == 1:
		edit_if_menu.show()
		if_spell.grab_focus()
		
	#WHILE EDITION MENU
	elif edition_type == 2:
		edit_while_menu.show()
		while_spell.grab_focus()
		
	#FOR EDITION MENU
	elif edition_type == 3:
		edit_for_menu.show()
		for_spell.grab_focus()
		
	_on_spell_pressed(edition_type)
	get_tree().paused = true	
	
## SETERS	
func set_type(type):
	self.spell_type = type

func set_target_type(type):
	self.target_type = type
	
func set_damage(damage_input):
	self.damage = damage_input
	
func set_target_lock(target):
	self.target_lock = target
	
func set_focus(edition_type):
	if edition_type == 1:
		if_spell.grab_focus()
	elif edition_type == 2:
		while_spell.grab_focus()
	elif edition_type == 3:
		for_spell.grab_focus()
		
func set_combo(combo_bool):
	self.combo = combo_bool

func set_combo_number(number):
	self.combo_number = number

## GETERS
func get_target_type():
	return self.target_type
	
func get_damage():
	return self.damage
	
func get_spell_type():
	return self.spell_type

func get_target_lock():
	return self.target_lock

func get_combo():
	return self.combo

func get_combo_number():
	return self.combo_number
