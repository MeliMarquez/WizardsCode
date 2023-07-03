extends GameLevel

func set_text():
	label_text = "Below, you can see the spellbook. 
	You currently only have one spell 
	that uses 2 Magic Points.\n
	Try to defeat these bats without 
	dying in the process..."

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("normal")
	
