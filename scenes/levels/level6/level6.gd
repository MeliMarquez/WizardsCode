extends GameLevel

func set_text():
	label_text = "Did you see that there are 
	also wicked goblins? Destroy them
	too !!!
	Remember that you have a new spell."

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("if")
