extends GameLevel

func set_text():
	label_text = "¡Wow! 
	
	You have defeated all the evil 
	beings that were lurking around us! 
	
	Thank you, Goopert the Wizard!"


func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.hide()
