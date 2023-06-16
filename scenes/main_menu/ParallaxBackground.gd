extends ParallaxBackground

var DIR = Vector2(1,1)
var SPEED = 1

func _physics_process(delta):
	scroll_base_offset += DIR * SPEED * delta
