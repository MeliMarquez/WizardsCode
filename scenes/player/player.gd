extends CharacterBody2D


@onready var ap = $AnimationPlayer;
@onready var sprite = $Sprite2D;


var bala = preload("res://scenes/spells/bala.tscn")
var spell_menu = preload("res://scenes/spells_section/spells_menu.tscn")


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 1000

var spells_menu_instance = spell_menu.instantiate()

func _ready():
	set_name("Player")
	get_parent().get_child(4).add_child(spells_menu_instance)
	spells_menu_instance.set_position(Vector2(10,10))

func _physics_process(delta):
	
	# Si no esta en el piso
	if not is_on_floor():
		# Bajar
		velocity.y += GRAVITY * delta 

	# Si se apreta saltar y estoy en el piso
	if Input.is_action_just_pressed("jump") and is_on_floor():
		# Subir
		velocity.y = JUMP_VELOCITY
	move_and_slide()
	

func _unhandled_input(_event):
	# 1 -> mover a la derecha - 0 -> mover desde velocidad actual a 0
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
		
	
	if Input.is_action_just_pressed("spell"):		
		_spell(spells_menu_instance.get_spell_type(),spells_menu_instance.get_subtype())
		
		
func _spell(type, subtype):
	var bala_instance = bala.instantiate()
	get_parent().add_child(bala_instance)
	
	bala_instance.set_position(global_position)
	if sprite.is_flipped_h() == true:
		bala_instance.set_direction(-1)
	bala_instance.set_type(type)
	bala_instance.set_subtype(subtype)
	
func handle_hit():
	pass	
