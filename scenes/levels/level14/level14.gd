extends GameLevel

func set_text():
	label_text = "Amazing! 
	You have a COMBO now! It uses less
	MP even though it is a mix!
	This spell will attack each purple 
	bat it touches one time! 
	Try it on this bat."

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("c1")

func set_magic_points():
	self.mp = 5
