extends Node2D

onready var level_global : LevelGlobal = $"/root/LevelGlobal"

func _on_body_entered(body) -> void:
	level_global.game_over()
