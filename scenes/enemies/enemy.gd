extends CharacterBody2D

@onready var ap = $AnimationPlayer;
@onready var cs = $CollisionShape2D
@onready var sprite = $Sprite2D

@export var health = 3
@export var sprite_type = 0

const GRAVITY = 1000


func _ready():
	if self.sprite_type == 0:
		self.set_modulate(Color(1,0,0))

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta 
		
	ap.play("fly")
	move_and_slide()
	
func handle_combo(combo_number):#, target_type, damage, target_lock):

	## WHILE SOBRE SALUD Y IF SOBRE ENEMIGOS
	if combo_number == 0:
		if self.sprite_type == 0:
			handle_hit(2,0,1,1)
			
	## WHILE SOBRE SALUD Y IF SOBRE AMIGOS
	elif combo_number == 1:
		if self.sprite_type == 1:
			handle_hit(2,1,1,1)
			
	## WHILE SOBRE HEALTH Y WHILE SOBRE ENEMIGOS
	elif combo_number == 2:
		handle_hit(2,self.sprite_type,1,1)
		

	
func handle_hit(spell_type, target_type, damage, target_lock):
	
	# Normal Spell
	if spell_type == 0:
		health_decrease()
		
	# If Spell
	elif spell_type == 1:
		if target_type == self.sprite_type:
			health_decrease()
		
	# WHILE Spell
	elif spell_type == 2:
		if target_lock == 0:
			health_decrease()
		elif target_lock == 1:
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
	print("Has perdido.")
