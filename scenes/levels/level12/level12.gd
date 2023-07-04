extends GameLevel

func set_text():
	label_text = "Now... Listen young wizard!
	The next levels you'll have to 
	go beyond the basic magic! Discover
	new spells by the union of the ones
	you already now and defeat the evil!
	Take a break destroying this goblin."

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("for")

func set_magic_points():
	self.mp = 5
