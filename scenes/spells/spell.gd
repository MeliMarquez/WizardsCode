extends Area2D

@onready var sprite = $Sprite2D
@onready var an = $AnimatedSprite2D

const SPEED = 600.0				# Bullet speed

var direction = 1				# -1 LEFT - 1 RIGHT
var type = 0					# 0 NORMAL SPELL - 1 IF - 2 WHILE - 3 FOR
var target_type: Sprites.TYPE	# FRIEND - PURPLE_BAT_ENEMY - BLUE_BAT_ENEMY - GOBLYN_ENEMY
var damage = 2					# AMOUNT OF DAMAGE
var target_lock = 0				# ITERATION OVER: 0 ENEMIES - 1 LIFE	
	
var combo = false				# COMBOS OMG
var combo_number = 0

func _ready():
	set_name("Spell")
	var normal = Color8(0,0,0)
	var verde = Color8(0,1,0)
	var rojo = Color8(1,0,0)
	var azul = Color8(0,0,1)
	if type == 0:
		set_color(normal)
	elif type == 1:
		set_color(verde)
	elif type == 2:
		set_color(rojo)
	elif type == 3:
		set_color(azul)
	#elif combo_number ==  1
	#set_color(mezcla1etc)

func _process(delta):		
	if direction == 1:
		an.set_global_rotation(3)
		
	position.x += SPEED * delta * direction
	if position.x > 2000 or position.x < 0: 
		queue_free()

		
func _on_body_entered(body):
	if body.get_name() != "Player":
		if not combo:
			if body.handle_hit(self.type, self.target_type, self.damage, self.target_lock):
				queue_free()

		else:
			#body.handle_hit(self.type, self.target_type, self.damage, self.target_lock)
			body.handle_combo(self.combo_number)#, self.target_type, self.damage, self.target_lock)
			if self.combo_number != 2:
				queue_free()
			
			
## SETERS

func set_direction(direction_input):
	self.direction = direction_input
	
func set_type(type_input):
	print("spell again: ", type_input)
	self.type = type_input
	if self.type== 0:
		set_color(Color(1,1,1))
	elif self.type == 1:
		set_color(Color(0,1,0))
	elif self.type == 2:
		set_color(Color(0,0,1))
	elif self.type == 3:
		set_color(Color(1,0,0))
	queue_redraw()

func set_target_type(target_type_input: Sprites.TYPE):
	self.target_type = target_type_input
		
func set_color(color_input):
	#sprite.set_modulate(color_input)
	an.set_modulate(color_input)
	queue_redraw()
	
func set_damage(damage_input):
	self.damage = damage_input

func set_target_lock(target_lock_input):
	self.target_lock = target_lock_input

func set_combo(combo_bool):
	self.combo = combo_bool
	
func set_combo_number(number):
	self.combo_number = number
