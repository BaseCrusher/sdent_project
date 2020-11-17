extends Node2D

export(bool) var is_pulling = false
var is_in_gravity: bool = false
onready var current_level : Node
onready var character


func _ready():
	current_level = $"/root/LevelGlobal".current_level
	character = current_level.character

func _physics_process(delta) -> void:
	if current_level != null and not current_level.is_game_over:
		if is_in_gravity:
			if is_pulling:
				character.move_direction += (global_position - character.global_position).normalized() * 20
				character.speed += (global_position - character.global_position).length() / 100 / character.VECTOR_LENGTH_TO_SPEED
			else:
				character.move_direction -= (global_position - character.global_position).normalized() * 20
				# TODO: add better calculation
				character.speed += (global_position - character.global_position).length() / 100 / character.VECTOR_LENGTH_TO_SPEED
			


func _on_Area2D_body_entered(body) -> void:
	is_in_gravity = true


func _on_Area2D_body_exited(body) -> void:
	is_in_gravity = false
