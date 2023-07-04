extends GameLevel

func set_text():
	label_text = "Now try it on these bats...
	Oh, yeah, and remember to attack
	the blue one."

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("c1")

func set_magic_points():
	self.mp = 5
