extends GameLevel

func set_text():
	label_text = "I don't like those goblins..."

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("if")
