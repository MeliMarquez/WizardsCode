extends MarginContainer

@onready var close = $PanelContainer/MarginContainer/VBoxContainer/Close

@onready var if_spell = %IfSpell
@onready var purple_bat = %PurpleBat
@onready var goblin = %Goblin
@onready var blue_bat = %BlueBat

@onready var arrow_1 = $Sprite2D
@onready var arrow_2 = $Sprite2D2
@onready var arrow_3 = $Sprite2D3
@onready var animation_player = $AnimationPlayer

@onready var while_spell = %WhileSpell
@onready var enemies = %Enemies
@onready var health = %Health

@onready var for_spell = %ForSpell

@onready var v_box_container = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer
@onready var v_box_container_2 = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2
@onready var v_box_container_3 = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer3
@onready var control = get_tree().get_first_node_in_group("control")

var spell_mixer
var spell = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	spell_mixer = get_parent()
	hide()
	var lvl = control.get_level()
	print("EL level es ",lvl)
	close.pressed.connect(_on_close_pressed)
	
	if_spell.pressed.connect(_on_if_pressed)
	purple_bat.pressed.connect(_on_enemie_pressed.bind(0))
	goblin.pressed.connect(_on_enemie_pressed.bind(1))
	blue_bat.pressed.connect(_on_enemie_pressed.bind(2))
	
	while_spell.pressed.connect(_on_while_pressed)
	enemies.pressed.connect(_on_target_pressed.bind(0))
	health.pressed.connect(_on_target_pressed.bind(1))
	

func selection(spell_number):
	show()
	blue_bat.hide()
	purple_bat.hide()
	goblin.hide()
	
	enemies.hide()
	health.hide()
	
	arrow_2.hide()
	arrow_3.hide()
	
	close.disabled = true
	
	if spell_number == 1:
		if_spell.disabled = true
		while_spell.disabled = true
		for_spell.disabled = true
		arrow_1.show()
		animation_player.play("arrow")
		while_spell.disabled = false
		
	elif spell_number == 2:
		if_spell.disabled = true
		while_spell.disabled = true
		for_spell.disabled = true
		arrow_1.show()
		animation_player.play("arrow")
		while_spell.disabled = false
		
	
	
func _on_close_pressed():
	spell_mixer.set_next_step()
	if spell == 1:
		spell_mixer.set_first_spell()
		spell = 2
	else:
		spell_mixer.set_second_spell()
	hide()
	
func _on_if_pressed():
	pass
	
func _on_while_pressed():
	arrow_1.hide()
	arrow_2.show()
	enemies.show()
	health.show()
	health.disabled = true
	enemies.disabled = true
	if spell == 1:
		animation_player.play("arrow_2")
		enemies.disabled = false
	else:
		animation_player.play("arrow_3")
		health.disabled = false
	
func _on_enemie_pressed(enemie):
	pass	

func _on_target_pressed(target):
	if spell == 1:
		arrow_2.hide()
		arrow_3.show()
		animation_player.play("arrow_2")
		close.disabled = false
	else:	
		arrow_2.hide()
		arrow_3.show()
		animation_player.play("arrow_2")
		close.disabled = false	
