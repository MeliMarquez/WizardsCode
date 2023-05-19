extends CharacterBody2D

@onready var ap = $AnimationPlayer;
@onready var sprite = $Sprite2D;

var spell = preload("res://scenes/spells/spell.tscn")
var spell_menu = preload("res://scenes/spells_section/spells_menu.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 1000

var spells_menu_instance

func _ready():
	set_name("Player")
	spells_menu_instance = get_tree().get_first_node_in_group("spells_menu_group")

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta 

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	move_and_slide()	

func _unhandled_input(_event):
	## MOVEMENT
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		ap.play("walk");
		if direction < 0:
			sprite.set_flip_h(true)
		else:
			sprite.set_flip_h(false)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left"):
		ap.pause()
	
	## SPELLS
	if Input.is_action_just_pressed("spell"):
		var s_type = spells_menu_instance.get_spell_type()
		var s_target_type = spells_menu_instance.get_target_type()
		var s_damage = spells_menu_instance.get_damage()
		var s_type_lock = spells_menu_instance.get_target_lock()
		
		var s_combo = spells_menu_instance.get_combo()
		var s_combo_number = spells_menu_instance.get_combo_number()
		
		throw_spell(s_type,s_target_type,s_damage,s_type_lock,s_combo,s_combo_number)
		
		
func throw_spell(spell_type, target_type, damage, target_lock, combo, combo_number):
	var spell_instance = spell.instantiate()
	get_parent().add_child(spell_instance)
	
	spell_instance.set_position(global_position)
	if sprite.is_flipped_h() == true:
		spell_instance.set_direction(-1)
		
	if not combo:
		spell_instance.set_type(spell_type)
		spell_instance.set_target_type(target_type)
		spell_instance.set_damage(damage)
		spell_instance.set_target_lock(target_lock)
		
	else: 
		spell_instance.set_combo(true)
		spell_instance.set_combo_number(combo_number)
