extends GameLevel
@onready var animation_player = $AnimationPlayer

func set_text():
	label_text = "Did you see that? 
	You have another option for this 
	spell's effect! Try the first one, 
	it attacks all enemies it finds 
	at once!"
	animation_player.play("arrow")

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("while_e")
