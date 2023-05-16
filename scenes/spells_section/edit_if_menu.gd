extends MarginContainer

@onready var enemigo = %Enemigo
@onready var amigo = %Amigo
@onready var close = %Close

var attack = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	enemigo.pressed.connect(_on_enemigo_pressed)	
	amigo.pressed.connect(_on_amigo_pressed)
	close.pressed.connect(_on_close_pressed)

func open_edition():
	show()
	get_tree().paused = true

func _on_enemigo_pressed():
	self.attack = 0
	
func _on_amigo_pressed():
	self.attack = 1
	
func _on_close_pressed():
	get_tree().paused = false
	hide()
	
func get_subtype():
	return self.attack

