extends GameLevel

func set_text():
	label_text = "Why don't you try using this 
	health spell to destroy these enemies?
	But to make it more interesting, now 
	you have fewer Magic Points."

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("while")

func set_magic_points():
	self.mp = 5
