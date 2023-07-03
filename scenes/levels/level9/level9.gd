extends GameLevel

func set_text():
	label_text = "Did you see that? 
	This spell has 2 types! Try the 
	second one, it attacks all enemies
	it finds at once!"

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("while_e")
