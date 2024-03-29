extends MarginContainer

@onready var normal_spell = %NormalSpell
@onready var if_spell = %IfSpell
@onready var while_spell = %WhileSpell
@onready var for_spell = %ForSpell

@onready var combo_1 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer5/Combo1
@onready var combo_2 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer6/Combo2
@onready var combo_3 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer7/Combo3

@onready var edit_if_menu = %EditIfMenu
@onready var edit_while_menu = %EditWhileMenu
@onready var edit_for_menu = %EditForMenu

@onready var book = $Spells/VBoxContainer/HBoxContainer/VBoxContainer8/Book
@onready var v_separator = $Spells/VBoxContainer/HBoxContainer/VSeparator
@onready var v_separator_2 = $Spells/VBoxContainer/HBoxContainer/VSeparator2

@onready var label = $Spells/VBoxContainer/HBoxContainer/VBoxContainer/Label
@onready var label1 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer2/Label
@onready var label2 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer3/Label
@onready var label3 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer4/Label
@onready var label4 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer5/Label
@onready var label5 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer6/Label
@onready var label6 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer7/Label

@onready var v_box_container = $Spells/VBoxContainer/HBoxContainer/VBoxContainer
@onready var v_box_container_2 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer2
@onready var v_box_container_3 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer3
@onready var v_box_container_4 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer4
@onready var v_box_container_5 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer5
@onready var v_box_container_6 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer6
@onready var v_box_container_7 = $Spells/VBoxContainer/HBoxContainer/VBoxContainer7

@onready var add_spell = $Spells/VBoxContainer/HBoxContainer/VBoxContainer8/Button
@onready var add_spell_label = $Spells/VBoxContainer/HBoxContainer/VBoxContainer8/Sprite2D
@onready var spell_mixer = $SpellMixer/SpellMixer
@onready var spell_mixer_2 = $SpellMixer/SpellMixer2

var v_box_container_2_visibility = false
var v_box_container_3_visibility = false
var v_box_container_4_visibility = false
var v_box_container_5_visibility = false
var v_box_container_6_visibility = false
var v_box_container_7_visibility = false
var disable_h = false
var disable_e = false

var spell_type = 0				# ALL SPELLS MANAGER: 	 0 Normal - 1 If - 2 While - 3 For
var target_type: Sprites.TYPE
var damage = 1					# FOR SPELL MANAGER:   	 Amount of attack's damage
var target_lock = 1			# WHILE SPELL MANAGER: 	 0 Amount of enemys - 1 Amount of life
var mp = 0

var combo = false
var combo_number = 0

var show_spells = false
@onready var control = get_tree().get_first_node_in_group("control")

func _ready():	
	_on_spell_pressed(0)

	_on_book_pressed()
	set_focus(0)
	normal_spell.pressed.connect(_on_spell_pressed.bind(0))
	if_spell.pressed.connect(_on_spell_pressed.bind(1))
	while_spell.pressed.connect(_on_spell_pressed.bind(2))
	for_spell.pressed.connect(_on_spell_pressed.bind(3))
	
	combo_1.pressed.connect(_on_combo_pressed.bind(0))	
	combo_2.pressed.connect(_on_combo_pressed.bind(1))	
	combo_3.pressed.connect(_on_combo_pressed.bind(2))
	
	add_spell.pressed.connect(_on_add_spell_pressed)
	#book.pressed.connect(_on_book_pressed)

func _on_add_spell_pressed():
	if control.get_level() == 13:
		spell_mixer.show_spell_mixer()
	elif control.get_level() == 16:
		spell_mixer_2.show_spell_mixer()

## ON BUTTONS PRESSED
func _on_spell_pressed(spell_type_input):
	_on_edit_pressed(spell_type_input)
	set_combo(false)
	set_type(spell_type_input)
	set_target_type(Sprites.TYPE.PURPLE_BAT_ENEMY)
	set_target_lock(1)

func _on_combo_pressed(combo_number_input):
	set_combo(true)
	set_combo_number(combo_number_input)

func set_mp(mp):
	self.mp=mp
func get_mp():
	return self.mp

func _on_edit_pressed(edition_type):
	
	if edition_type == 0:
		set_mp(2)
		return
	
	#IF EDITIOM MENU
	elif edition_type == 1:
		set_mp(1)		
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
		
	get_tree().paused = true	
	
## SETERS	
func set_type(type):
	self.spell_type = type

func set_target_type(type: Sprites.TYPE):
	self.target_type = type
	
func set_damage(damage_input):
	self.damage = damage_input
	
func set_target_lock(target):
	self.target_lock = target
	
func set_focus(edition_type):
	if edition_type == 0:
		normal_spell.grab_focus()
	elif edition_type == 1:
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

func _on_book_pressed():
	if self.show_spells:
		v_separator.show()
		v_box_container.show()
		if v_box_container_2_visibility:
			v_box_container_2.show()
		if v_box_container_3_visibility:
			v_box_container_3.show()
			edit_while_menu.disable_elements(self.disable_e, self.disable_h)
		if v_box_container_4_visibility:
			v_box_container_4.show()
			
		
		if combo:
			v_separator_2.show()
			if v_box_container_5_visibility:
				v_box_container_5.show()
			if v_box_container_6_visibility:
				v_box_container_6.show()
			if v_box_container_7_visibility:
				v_box_container_7.show()
			
		self.show_spells = false
	else:
		v_separator.hide()
		v_box_container.hide()
		v_box_container_2.hide()
		v_box_container_3.hide()
		v_box_container_4.hide()
		
		v_separator_2.hide()
		v_box_container_5.hide()
		v_box_container_6.hide()
		v_box_container_7.hide()
		
		self.show_spells = true

func set_not_visible(s):
	disable_add()
	if s == "if":
		self.v_box_container_2_visibility = true
	elif s == "while_h":
		self.v_box_container_2_visibility = true
		self.v_box_container_3_visibility = true
		self.disable_h = true
	elif s == "while_e":
		self.v_box_container_2_visibility = true
		self.v_box_container_3_visibility = true
		self.disable_e = true
	elif s == "while":
		self.v_box_container_2_visibility = true
		self.v_box_container_3_visibility = true
		self.disable_h = true
		self.disable_e = true
	elif s == "for":
		self.v_box_container_2_visibility = true
		self.v_box_container_3_visibility = true
		self.v_box_container_4_visibility = true
		self.disable_h = true
		self.disable_e = true
	elif s == "add":
		self.v_box_container_2_visibility = true
		self.v_box_container_3_visibility = true
		self.v_box_container_4_visibility = true
		self.disable_h = true
		self.disable_e = true
		add_spell.disabled = false
		add_spell_label.modulate = Color(1, 1, 1, 1)
		add_spell.show()
		add_spell_label.show()
	elif s == "add2":
		self.v_box_container_2_visibility = true
		self.v_box_container_3_visibility = true
		self.v_box_container_4_visibility = true
		self.v_box_container_5_visibility = true
		set_combo(true)
		self.disable_h = true
		self.disable_e = true
		add_spell.disabled = false
		add_spell_label.modulate = Color(1, 1, 1, 1)
		add_spell.show()
		add_spell_label.show()
	elif s == "c1":
		set_combo(true)
		self.v_box_container_2_visibility = true
		self.v_box_container_3_visibility = true
		self.v_box_container_4_visibility = true
		self.v_box_container_5_visibility = true
		self.disable_h = true
		self.disable_e = true
	elif s == "c2":
		set_combo(true)
		self.v_box_container_2_visibility = true
		self.v_box_container_3_visibility = true
		self.v_box_container_4_visibility = true
		self.v_box_container_5_visibility = true
		self.v_box_container_7_visibility = true
		self.disable_h = true
		self.disable_e = true
	elif s == "c3":
		set_combo(true)
		self.v_box_container_2_visibility = true
		self.v_box_container_3_visibility = true
		self.v_box_container_4_visibility = true
		self.v_box_container_5_visibility = true
		self.v_box_container_6_visibility = true
		self.v_box_container_7_visibility = true
		self.disable_h = true
		self.disable_e = true
	self.show_spells = true
	_on_book_pressed()
		
func disable_add():
	add_spell.disabled = true
	add_spell.hide()
	add_spell_label.modulate = Color(0.745098, 0.745098, 0.745098, 1)
	add_spell_label.hide()
	
func show_c1():
	set_combo(true)
	set_not_visible("c1")
	
func show_c2():
	set_combo(true)
	set_not_visible("c2")
		
		
		
		
		
		
		
		
		
		
