extends GameLevel

@onready var area_2d = $Area2D

func set_text():
	label_text = "There you are, Goopert the Wizard!
	Can you move? Try reaching the dotted \nline.
	[ Press <- to walk to the left ]
	[ Press -> to walk to the right ]
	[ Press SPACE to jump ]"


func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		next_level()
		
