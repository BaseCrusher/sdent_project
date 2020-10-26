extends Node

var character : Node2D
const JUMP_PLATES = []

func _ready():
	pass 

func get_character_node() -> Node2D:
	if character == null:
		var scene = preload("res://GameObjects/Character/Character.tscn").instance()
		add_child(scene)
		character = scene.get_node("icon")
	return character

func add_to_jump_plates(plate):
	JUMP_PLATES.append(plate)

func activate_all_jump_plates():
	for plate in JUMP_PLATES:
		plate.is_active = true
