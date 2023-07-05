extends MarginContainer

@onready var spell_one = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/TextureButton
@onready var spell_two = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/TextureButton2
@onready var spell_selection = $SpellSelection

@onready var combine = $PanelContainer/MarginContainer/VBoxContainer/Combine
@onready var spell_result = $PanelContainer/MarginContainer/VBoxContainer/TextureRect

@onready var close = %Close
@onready var animation_player = $AnimationPlayer

@onready var arrow_1 = $Sprite2D
@onready var arrow_2 = $Sprite2D2
@onready var arrow_3 = $Sprite2D3
@onready var arrow_4 = $Sprite2D4
@onready var control = get_tree().get_first_node_in_group("control")

var left_selection = false
var right_selection = false
var selection 
var step = 0

var spell_menu 

func _ready():
	spell_menu = get_parent().get_parent()
	hide()
	print("Iniciando el spell mixer 2 two")
	spell_one.pressed.connect(_choose_spell.bind("left"))
	spell_two.pressed.connect(_choose_spell.bind("right"))
	combine.pressed.connect(_on_combine)
	close.pressed.connect(_on_close)
	
func show_spell_mixer():
	show()
	spell_one.disabled = true
	spell_two.disabled = true
	combine.disabled = true
	close.disabled = true
	get_tree().paused = true
	arrow_1.show()
	animation_player.play("arrow_left")
	spell_one.disabled = false
	
func _choose_spell(side):
	if side == "left":
		spell_selection.selection(1)
	else:
		spell_selection.selection(2)
	arrow_1.hide()
	arrow_2.hide()

func _on_close():
	get_tree().paused = false
	hide()
	spell_menu.disable_add()
	spell_menu.show_c2()
	control.next_level()
	
func _on_combine():
	if left_selection and right_selection:
		spell_result.texture = load("res://assets/images/spells/64x64_FX_13.png")
		arrow_3.hide()
		set_next_step()

func set_next_step():
	self.step += 1
	if self.step == 1:
		left_selection = true
		arrow_2.show()
		animation_player.play("arrow_left")
		spell_two.disabled = false
	elif self.step == 2:
		right_selection = true
		arrow_3.show()
		animation_player.play("arrow_left")
		combine.disabled = false
	elif self.step == 3:
		arrow_4.show()
		animation_player.play("arrow_left")
		close.disabled = false
	
func set_first_spell():
	spell_one.texture_normal = load("res://assets/images/spells/64x64_FX_2.png")

func set_second_spell():
	spell_two.texture_normal = load("res://assets/images/spells/64x64_FX_2.png")
