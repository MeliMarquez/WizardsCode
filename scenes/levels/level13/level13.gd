extends GameLevel

func set_text():
	label_text = "Let the magic happen! 
	Do you see the 'ADD' button below the
	spellbook? 
	Press it to open the spell mixer!"

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("add")

func set_magic_points():
	self.mp = 5
