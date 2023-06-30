extends GameLevel

func set_text():
	label_text = "Wow! 
	Now try to defeat these spawns 
	of evil..."

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("normal")
