extends CharacterBody2D

@onready var animation = $AnimatedSprite2D/AnimationPlayer
@onready var sprite = $AnimatedSprite2D
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")
@onready var spells_menu = preload("res://scenes/spells_section/spells_menu.tscn")
@onready var magic_points_label = $Resources/MagicPoints
@onready var lose_level = $Menus/LoseLevel
@onready var next_level = $Menus/NextLevel
@onready var win_game = $Menus/Victory
@onready var level_label = $Resources/Level
@onready var audio_stream_player_2d = $AudioStreamPlayer2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 1000

var spell = preload("res://scenes/spells/spell.tscn")
var magic_points = 10

var actual_level = 0
@onready var spells_menu_instance = get_parent().get_node("Menu Spells/SpellsMenu")
@onready var control = get_tree().get_first_node_in_group("control")

func _ready():
	spells_menu_instance = get_parent().get_node("Menu Spells/SpellsMenu")
	animation_tree.active = true
	set_name("Player")
	self.magic_points_label.set_text(" Magic Points: "+str(self.magic_points))
	self.level_label.set_text("Level: 0")
	
func set_magic_points(mp):
	self.magic_points = mp
	self.magic_points_label.set_text(" Magic Points: "+str(self.magic_points))

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta 

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		playback.travel("jump")
		
	move_and_slide()	

func go_to_next_level():
	next_level.next_level()

func set_level(lvl):
	self.level_label.set_text("Level: "+str(lvl))

func _unhandled_input(_event):
	## MOVEMENT
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		
		velocity.x = direction * SPEED
		playback.travel("walk");
		if direction < 0:
			sprite.set_flip_h(true)
		else:
			sprite.set_flip_h(false)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		playback.travel("idle");
	
	## SPELLS
	if Input.is_action_just_pressed("spell") and control.get_level()!= 0:
		var s_type = spells_menu_instance.get_spell_type()
		var s_target_type = spells_menu_instance.get_target_type()
		var s_damage = spells_menu_instance.get_damage()
		var s_type_lock = spells_menu_instance.get_target_lock()
		
		var mp = spells_menu_instance.get_mp()
		
		var s_combo = spells_menu_instance.get_combo()	
		var s_combo_number = spells_menu_instance.get_combo_number()
		
		throw_spell(s_type,s_target_type,s_damage,s_type_lock,s_combo,s_combo_number,mp)
		
		
func throw_spell(spell_type, target_type, damage, target_lock, combo, combo_number, mp):
	
	playback.travel("cast");
	var spell_instance = spell.instantiate()
	get_parent().add_child(spell_instance)
	
	spell_instance.set_position(global_position)
	if sprite.is_flipped_h() == true:
		spell_instance.set_direction(-1)
		
	if not combo:
		decrease_magic_points(mp)
		spell_instance.set_type(spell_type)
		spell_instance.set_target_type(target_type)
		spell_instance.set_damage(damage)
		spell_instance.set_target_lock(target_lock)
		
	else: 
		spell_instance.set_combo(true)
		spell_instance.set_combo_number(combo_number)
		if combo_number == 0:
			decrease_magic_points(3)
		elif combo_number == 2:
			decrease_magic_points(5)

		
		
func decrease_magic_points(mp):		
	self.magic_points -= mp
	self.magic_points_label.set_text(" Magic Points: "+str(self.magic_points))
	if self.magic_points < 0:
		if control.get_level() != 1:
			lose_level.lose_level()

func win():
	win_game.win_game()

func audio():
	audio_stream_player_2d.play()
	await audio_stream_player_2d.finished
