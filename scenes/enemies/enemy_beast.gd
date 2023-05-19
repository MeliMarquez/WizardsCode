extends CharacterBody2D

@onready var ap = $AnimationPlayer;
@onready var sprite = $Sprite2D

const GRAVITY = 1000

func _physics_process(delta):
	
	# Si no esta en el piso
	if not is_on_floor():
		# Bajar
		velocity.y += GRAVITY * delta 
		
	ap.play("fly")
	move_and_slide()
	
func handle_hit(spell_type, sub_type):
	sprite.hide()