extends CharacterBody2D

@onready var ap = $AnimationPlayer;
@onready var cs = $CollisionShape2D
@onready var sprite = $Sprite2D

@export var health = 3
@export var sprite_type = 0		# 0 ENEMY - 1 FRIEND por ahora

const GRAVITY = 1000


func _ready():
	if self.sprite_type == 0:
		self.set_modulate(Color(1,0,0))

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta 
	ap.play("fly")
	move_and_slide()
	
func handle_hit(spell_type, target_type, damage):
	# Normal Spell
	if spell_type == 0:
		health_decrease()
		
	# If Spell
	elif spell_type == 1:
		if target_type == self.sprite_type:
			health_decrease()
		
	# WHILE Spell
	elif spell_type == 2:
		while self.health >= 1:
			health_decrease()
	
	# FOR Spell
	elif spell_type == 3:
		for i in range(damage):
			health_decrease()

func health_decrease():
	self.health = self.health-1
	if self.health == 0:
		handle_dead()

func handle_dead():
	if self.sprite_type == 1:
		lost_level()
	queue_free()

func lost_level():
	print("YOU KILLED A FRIEND, YOU LOST.")
