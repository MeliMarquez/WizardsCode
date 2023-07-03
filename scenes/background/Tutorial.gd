extends CanvasLayer

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer

var brightness = 0

func _ready():
	print("Tutorial")
	animation_player.play("appear")
	await animation_player.animation_finished
	animation_player.play("write")
