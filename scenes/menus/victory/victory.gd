extends MarginContainer

@onready var exit = %Exit


func _ready():
	hide()
	exit.pressed.connect(_on_exit_pressed)

func win_game():
	show()
	get_tree().paused = true
	
func _on_exit_pressed():
	get_tree().quit()

