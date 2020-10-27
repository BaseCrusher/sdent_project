extends Node

const JUMP_PLATES = []
var start_node : Node2D = null
var character : KinematicBody2D

func get_character_node() -> KinematicBody2D:
	if character == null:
		var scene = preload("res://GameObjects/Character/Character.tscn").instance()
		add_child(scene)
		character = scene as KinematicBody2D
		character.z_index = 10
	return character





func _ready():
	pass 

func activate_all_jump_plates():
	for plate in JUMP_PLATES:
		plate.is_active = true
