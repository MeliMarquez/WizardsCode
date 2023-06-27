extends MarginContainer

@onready var bat_purple = %BatPurple
@onready var goblyn = %Goblyn
@onready var bat_blue = %BatBlue

@onready var spells_menu

func _ready():
	spells_menu = get_parent().get_parent()
	hide()
	bat_purple.pressed.connect(_on_target_pressed.bind(Sprites.TYPE.PURPLE_BAT_ENEMY))	
	goblyn.pressed.connect(_on_target_pressed.bind(Sprites.TYPE.GOBLYN_ENEMY))	
	bat_blue.pressed.connect(_on_target_pressed.bind(Sprites.TYPE.BLUE_BAT_ENEMY))

func open_edition():
	show()
	get_tree().paused = true

## ON BUTTONS PRESSED
func _on_target_pressed(target_type_input: Sprites.TYPE):
	spells_menu.set_target_type(target_type_input)
	get_tree().paused = false
	hide()
	spells_menu.set_focus(1)
