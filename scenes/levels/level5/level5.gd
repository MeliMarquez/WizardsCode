extends GameLevel

func set_text():
	label_text = "Oh no... 
	I forgot to tell you!
	You now have another spell on your 
	list, it uses less MP but you have 
	to chose what you wanna hit. 
	Try it!"

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("if")
