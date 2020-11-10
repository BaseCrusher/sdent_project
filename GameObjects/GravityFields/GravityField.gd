extends Node2D

export(bool) var is_pulling = false
var is_in_gravity: bool = false
onready var level_global : Node = $"/root/LevelGlobal"

func _physics_process(delta) -> void:
	if is_in_gravity:
		if is_pulling:
			level_global.character.move_direction += (global_position - level_global.character.position).normalized() * 20
			level_global.character.speed += (global_position - level_global.character.position).length() / 100 / level_global.character.VECTOR_LENGTH_TO_SPEED
		else:
			level_global.character.move_direction -= (global_position - level_global.character.position).normalized() * 20
			# TODO: add better calculation
			level_global.character.speed += (global_position - level_global.character.position).length() / 100 / level_global.character.VECTOR_LENGTH_TO_SPEED
		


func _on_Area2D_body_entered(body) -> void:
	is_in_gravity = true


func _on_Area2D_body_exited(body) -> void:
	is_in_gravity = false
