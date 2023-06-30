extends MarginContainer

@onready var enemies = %Enemies
@onready var health = %Health

var spells_menu

func _ready():
	spells_menu = get_parent().get_parent()
	hide()
	enemies.pressed.connect(_on_target_pressed.bind(0))	
	health.pressed.connect(_on_target_pressed.bind(1))
	

func open_edition():
	show()
	get_tree().paused = true

## ON BUTTONS PRESSED
func _on_target_pressed(target_lock_input):
	spells_menu.set_target_lock(target_lock_input)
	get_tree().paused = false
	hide()
	spells_menu.set_focus(2)
	if target_lock_input == 0:
		spells_menu.set_damage(4)	
	else:
		spells_menu.set_damage(2)	

