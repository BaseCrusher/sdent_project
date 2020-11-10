extends Node

const JUMP_PLATES = []
var start_node : Node2D = null
var character : KinematicBody2D
var is_game_over = false
var current_level = null
signal game_over
signal level_loaded

func get_character_node() -> KinematicBody2D:
	if character == null:
		var scene = preload("res://GameObjects/Character/Character.tscn").instance()
		add_child(scene)
		character = scene as KinematicBody2D
		character.z_index = 10
	return character


func _ready():
	pass 

func set_current_level(level):
	current_level = level
	emit_signal("level_loaded")
	pass

func _process(delta):
	if current_level != null and not is_game_over and character.speed == 0.0 and character.state != CharacterStates.ATTACHED_TO_PLATE:
		game_over()
	pass


func activate_all_jump_plates():
	for plate in JUMP_PLATES:
		plate.is_active = true

func game_over():
	is_game_over = true
	emit_signal("game_over")
	

func remove_character():
	remove_child(character)
	character = null
	
