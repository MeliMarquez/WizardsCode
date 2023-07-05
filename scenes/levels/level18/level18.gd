extends GameLevel

func set_text():
	label_text = "This is... THE LAST BATTLE!
	Use the last spell to attack
	all the enemies at once and destroy 
	the forces of evil forever!
	Go go go Goopert the Wizard!"

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("c2")

func set_magic_points():
	self.mp = 5
