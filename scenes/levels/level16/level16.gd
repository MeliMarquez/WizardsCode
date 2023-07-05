extends GameLevel

func set_text():
	label_text = "Good job!
	Let's create another Combo!
	Press ADD below the spell book and
	follow the arrows."

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("add2")

func set_magic_points():
	self.mp = 5
