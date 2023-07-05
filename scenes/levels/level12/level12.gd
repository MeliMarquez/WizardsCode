extends GameLevel

func set_text():
	label_text = "Now... Listen young wizard!
	The next levels you'll have to 
	go beyond the basics of magic! Discover
	new spells by combining the ones
	you already know and defeat evil!
	Take a break destroying this goblin."

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("for")

func set_magic_points():
	self.mp = 5
