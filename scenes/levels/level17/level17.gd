extends GameLevel

func set_text():
	label_text = "Yeeeeeeeeeey!
	Now you can attack all enemies
	until their life reaches zero!\n
	This is the Ultimate Spell! 
	Try it!"

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("c2")

func set_magic_points():
	self.mp = 5
