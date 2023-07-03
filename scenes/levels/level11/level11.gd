extends GameLevel

func set_text():
	label_text = "Maybe you could try with
	this new spell! Is like the last one
	but you have to specify the amount of 
	times you wanna hit the target [n]. 
	It uses n/2 MP."

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("for")

func set_magic_points():
	self.mp = 5
