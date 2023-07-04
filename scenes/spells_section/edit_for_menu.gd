extends MarginContainer

@onready var spin_box = %SpinBox
@onready var close = %Close

var spells_menu

func _ready():
	spells_menu = get_parent().get_parent()
	hide()
	close.pressed.connect(_on_close_pressed)


## ON BUTTONS PRESSED
func open_edition():
	show()
	get_tree().paused = true
	
func _on_close_pressed():
	get_tree().paused = false
	hide()
	spells_menu.set_damage(spin_box.value)
	spells_menu.set_focus(3)
	spells_menu.set_mp(int(spin_box.value/2))
	spells_menu.set_damage(spin_box.value)
