class_name Sprites
extends CharacterBody2D

enum TYPE {FRIEND, PURPLE_BAT_ENEMY, BLUE_BAT_ENEMY, GOBLYN_ENEMY}

@onready var health_label = $Health
@onready var cs = $CollisionShape2D
@onready var sprite = $AnimatedSprite2D
@onready var ap = $AnimatedSprite2D/AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")

@export var health = 3
@export var sprite_type: TYPE

const GRAVITY = 1000

func _ready():	
	animation_tree.active = true
	self.health_label.set_text(str(self.health))
	match sprite_type:
		TYPE.PURPLE_BAT_ENEMY: 
			playback.travel("idle_purple_bat")
		TYPE.BLUE_BAT_ENEMY:
			playback.travel("idle_blue_bat")
		TYPE.GOBLYN_ENEMY:
			playback.travel("idle_goblyn")
		TYPE.FRIEND:
			playback.travel("idle_friend")
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta 		
	move_and_slide()	
	
func handle_combo(combo_number):#REHACER TODO ESTO

	## WHILE SOBRE SALUD Y IF 
	if combo_number == 0:
		if self.sprite_type == 0:
			handle_hit(2,0,1,1)
			
	## WHILE SOBRE SALUD Y IF SOBRE AMIGOS
	elif combo_number == 1:
		if self.sprite_type == 1:
			handle_hit(2,1,1,1)
			
	## WHILE & WHILE
	elif combo_number == 2:
		handle_hit(2,self.sprite_type,self.health,0)
	
func handle_hit(spell_type, target_type: Sprites.TYPE , damage, target_lock):
	# Normal Spell
	if spell_type == 0:
		health_decrease(1)
		return true
		
	# If Spell
	elif spell_type == 1:
		if target_type == self.sprite_type:
			health_decrease(1)
			return true
		
	# WHILE Spell
	elif spell_type == 2:
		if target_lock == 0:
			health_decrease(1)
		elif target_lock == 1:
			while self.health >= 1:
				health_decrease(1)
			return true
			
	# FOR Spell
	elif spell_type == 3:
		for i in range(damage):
			health_decrease(1)
			return true
			
	return false
			

func health_decrease(damage):
	match sprite_type:
		TYPE.PURPLE_BAT_ENEMY:
			playback.travel("hit_purple_bat")
		TYPE.BLUE_BAT_ENEMY:
			playback.travel("hit_blue_bat")
		TYPE.GOBLYN_ENEMY:
			playback.travel("hit_goblyn")
	self.health = self.health-damage
	self.health_label.set_text(str(self.health))
	if self.health == 0:
		handle_dead()
		
func handle_dead():
	if self.sprite_type == TYPE.FRIEND:
		lost_level()
	queue_free()

func lost_level():
	print("Has perdido.")
