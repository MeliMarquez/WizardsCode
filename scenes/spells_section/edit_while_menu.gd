extends MarginContainer

@onready var enemies = %Enemies
@onready var health = %Health
@onready var animation_player = $AnimationPlayer
@onready var control = get_tree().get_first_node_in_group("control")
@onready var arrow = $Sprite2D

var spells_menu

func _ready():
	spells_menu = get_parent().get_parent()
	hide()
	arrow.hide()
	if control.get_level() == 8:
		arrow.show()
		animation_player.play("arrow")
	elif control.get_level() == 9:
		arrow.show()
		animation_player.play("arrow_2")
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
		spells_menu.set_mp(4)	
	else:
		spells_menu.set_mp(2)	

func disable_elements(e, h):
	if not e:
		enemies.set_disabled(true)
	elif not h:
		health.set_disabled(true)
	else:
		enemies.set_disabled(false)
		health.set_disabled(false)
