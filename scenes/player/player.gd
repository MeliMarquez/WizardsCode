extends CharacterBody2D

@onready var ap = $AnimationPlayer;
@onready var sprite = $Sprite2D;


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 1000

signal send_spell


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
		
	var spell = Input.is_action_just_pressed("spell")
	if spell:
		sprite.visible = false
		
	
	
