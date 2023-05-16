extends Area2D

@onready var sprite = $Sprite2D

const SPEED = 600.0				# Bullet speed
var DIRECTION = 1				# -1 LEFT - 1 RIGHT
var TYPE = 0					# 0 NORMAL SPELL - 1 IF - 2 WHILE - 3 FOR
var SUBTYPE = 0					# 0 ENEMY - 1 FRIEND
var DAMAGE = 2				# AMOUNT OF DAMAGE
var COLOR = Color(0, 0, 0)		# Handle spell design


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += SPEED * delta * DIRECTION
	if position.x > 1000 or position.x < 100:
		queue_free()
		
func set_direction(direction):
	self.DIRECTION = direction
	
func set_type(type):
	self.TYPE = type
	if self.TYPE == 0:
		set_color(Color(1,0,0))
	elif self.TYPE == 1:
		set_color(Color(0,1,0))
	elif self.TYPE == 2:
		set_color(Color(0,0,1))
	elif self.TYPE == 3:
		set_color(Color(1,1,1))
	queue_redraw()

func set_subtype(subtype):
	self.SUBTYPE = subtype
		
func set_color(color):
	self.COLOR = color
	sprite.set_modulate(COLOR)
	queue_redraw()
	

func _on_body_entered(body):
	if body.get_name() != "Player":
		## Esto es solo para ver lo del subtipo
		#if self.TYPE == 1:
		#	body.handle_hit(self.TYPE, 0, self.DAMAGE)
		#elif self.TYPE == 2:
		#	body.handle_hit(self.TYPE, 1, self.DAMAGE)
		#else:
		#	body.handle_hit(self.TYPE, self.SUBTYPE, self.DAMAGE)
			
		## Aqui lo que deberia ir
		body.handle_hit(self.TYPE, self.SUBTYPE, self.DAMAGE)
			
		queue_free()

