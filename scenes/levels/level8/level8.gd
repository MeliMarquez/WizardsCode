extends GameLevel

func set_text():
	label_text = "Yes, yes, yes... 
	here's a new spell for you. 
	When it finds a target, it strikes it 
	until its life reaches zero. It 
	consumes the same MP as the first 
	attack. Very convenient, isn't it?"

func hide_elements():
	var menu_spell = get_node("Menu Spells/SpellsMenu")	
	menu_spell.set_not_visible("while_h")
