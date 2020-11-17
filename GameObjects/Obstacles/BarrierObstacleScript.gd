extends Node2D

var current_level
var character : Character

func _ready():
	current_level = $"/root/LevelGlobal".current_level
	character = current_level.character

func _on_body_entered(body) -> void:
	if character.state != CharacterStates.ATTACHED_TO_PLATE:
		current_level.game_over()
