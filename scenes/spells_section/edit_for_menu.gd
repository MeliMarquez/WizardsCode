extends MarginContainer

@onready var spin_box = %SpinBox
@onready var close = %Close

var spells_menu

func _ready():
	hide()
	close.pressed.connect(_on_close_pressed)

	spells_menu = get_tree().get_first_node_in_group("spells_menu_group")

## ON BUTTONS PRESSED
func open_edition():
	show()
	get_tree().paused = true
	
func _on_close_pressed():
	get_tree().paused = false
	hide()
	spells_menu.set_damage(spin_box.value)
	spells_menu.set_focus(3)
