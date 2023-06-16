extends CharacterBody2D

@onready var ap = $AnimatedSprite2D/AnimationPlayer
@onready var sprite = $AnimatedSprite2D
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")

var spell = preload("res://scenes/spells/spell.tscn")
var spell_menu = preload("res://scenes/spells_section/spells_menu.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 1000

var spells_menu_instance

var magic_points = 100

func _ready():
	animation_tree.active = true
	set_name("Player")
	spells_menu_instance = get_tree().get_first_node_in_group("spells_menu_group")
	#sprite.play("idle")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta 

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		#ap.play("jump")
		playback.travel("jump")
		
	move_and_slide()	

func _unhandled_input(_event):
	## MOVEMENT
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		playback.travel("walk");
		if direction < 0:
			sprite.set_flip_h(true)
		else:
			sprite.set_flip_h(false)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		playback.travel("idle");

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
		decrease_magic_points()
		
		
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
		## ESTO ES PARA LANZAR UN HIT SPELL NO MAS SIN MAS NADA
		set_spell_values_from_spells_mixer(combo_number, spell_instance)
		
func decrease_magic_points():
	self.magic_points-=1
	
func set_spell_values_from_spells_mixer(combo_number, spell_instance):
	## POR AHORA CON VALORES
	if combo_number == 0:
		spell_instance.set_type(2)
		spell_instance.set_target_type(0)
		spell_instance.set_damage(1)
		spell_instance.set_target_lock(1)		
	elif combo_number == 1:
		spell_instance.set_type(2)
		spell_instance.set_target_type(1)
		spell_instance.set_damage(1)
		spell_instance.set_target_lock(1)
