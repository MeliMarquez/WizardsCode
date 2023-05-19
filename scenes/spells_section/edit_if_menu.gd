extends MarginContainer

@onready var enemy = %Enemy
@onready var friend = %Friend

var spells_menu

func _ready():
	hide()
	enemy.pressed.connect(_on_target_pressed.bind(0))	
	friend.pressed.connect(_on_target_pressed.bind(1))
	
	spells_menu = get_tree().get_first_node_in_group("spells_menu_group")

func open_edition():
	show()
	get_tree().paused = true

## ON BUTTONS PRESSED
func _on_target_pressed(target_type_input):
	spells_menu.set_target_type(target_type_input)
	get_tree().paused = false
	hide()
	spells_menu.set_focus(1)
