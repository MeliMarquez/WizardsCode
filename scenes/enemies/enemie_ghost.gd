extends CharacterBody2D

@onready var ap = $AnimationPlayer;
@onready var cs = $CollisionShape2D
@onready var sprite = $Sprite2D

const GRAVITY = 1000
@export var HEALTH = 3
@export var TYPE_SPRITE = 0


func _ready():
	if self.TYPE_SPRITE == 0:
		self.set_modulate(Color(1,0,0))

func _physics_process(delta):
	
	# Si no esta en el piso
	if not is_on_floor():
		# Bajar
		velocity.y += GRAVITY * delta 
		
	ap.play("fly")
	move_and_slide()
	
	
func handle_hit(spell_type, sub_type, damage):
	# Normal Spell
	if spell_type == 0:
		print("Hit By Spell: NORMAL")
		health_decrease()
		
	# If Spell
	elif spell_type == 1:
		print("Hit By Spell: IF")
		if sub_type == self.TYPE_SPRITE:
			health_decrease()
		
	# WHILE Spell
	elif spell_type == 2:
		print("Hit By Spell: WHILE")
		while self.HEALTH >=1:
			health_decrease()
			
	elif spell_type == 3:
		print("Hit By Spell: FOR")
		for i in range(damage):
			health_decrease()

func health_decrease():
	self.HEALTH = self.HEALTH-1
	if self.HEALTH == 0:
		handle_dead()
		

func handle_dead():
	if self.TYPE_SPRITE == 1:
		lost_level()
	queue_free()

func lost_level():
	print("perdiste perkin")
	
	
	
