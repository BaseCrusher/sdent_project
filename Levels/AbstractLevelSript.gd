extends Node2D

onready var level_global : Node = $"/root/LevelGlobal"
var JUMP_PLATES = []
var start_node : Node2D = null
var character : KinematicBody2D
var is_game_over = false
var current_level = null

func _ready():
	var scene = preload("res://GameObjects/Character/Character.tscn").instance()
	add_child(scene)
	character = scene as KinematicBody2D
	character.z_index = 10
	level_global.current_level = self

func get_character_node() -> KinematicBody2D:
	if character == null:
		var scene = preload("res://GameObjects/Character/Character.tscn").instance()
		add_child(scene)
		character = scene as KinematicBody2D
		character.z_index = 10
		$LevelUI/LevelCamera.on_character_added(character)
	return character

func game_over():
	is_game_over = true
	character.speed = 0.0
	$LevelUI/GameOver._on_game_over()

func level_completed():
	$LevelUI/LevelCompleted._on_level_completed()
	$LevelUI/PlayUI/Button.visible = false


func activate_all_jump_plates():
	for plate in JUMP_PLATES:
		plate.is_active = true
