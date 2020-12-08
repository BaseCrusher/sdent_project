extends Node2D
class_name BouncingPlate

var current_level
var character : Character


func _ready():
	current_level = $"/root/LevelGlobal".current_level
	character = current_level.character
	print(character.position)
	print(position)



