class_name Sprites
extends CharacterBody2D

enum TYPE {FRIEND, PURPLE_BAT_ENEMY, BLUE_BAT_ENEMY, GOBLYN_ENEMY}

@onready var cs = $CollisionShape2D
@onready var sprite = $AnimatedSprite2D
@onready var ap = $AnimatedSprite2D/AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")

@onready var health_label = $Health

@onready var hearth1 = $Sprite2D2
@onready var hearth2 = $Sprite2D3
@onready var hearth3 = $Sprite2D4

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
		print("punch")
		return true
		
	# If Spell
	elif spell_type == 1:
		if target_type == self.sprite_type:
			health_decrease(1)
			print("tajo")
			return true
		
	# WHILE Spell
	elif spell_type == 2:
		if target_lock == 0:
			health_decrease(1)
			print("punch")
		elif target_lock == 1:
			while self.health >= 1:
				health_decrease(1)
				print("circle")
			return true
			
	# FOR Spell
	elif spell_type == 3:
		for i in range(damage):
			health_decrease(1)
			print("circle")
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
	
	#way 1
	self.health_label.set_text(str(self.health))
	
	#way 2
	if hearth2.is_visible_in_tree():
		hearth2.hide()
	elif hearth1.is_visible_in_tree():
		hearth1.hide()
	else: 
		hearth3.hide()
		
	if self.health == 0:
		handle_dead()
		
func handle_dead():
	if self.sprite_type == TYPE.FRIEND:
		lost_level()
	queue_free()

func lost_level():
	print("Has perdido.")
