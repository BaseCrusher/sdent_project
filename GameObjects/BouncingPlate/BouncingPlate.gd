extends Node2D
class_name BouncingPlate

var current_level
var character : Character


func _ready():
	current_level = $"/root/LevelGlobal".current_level
	character = current_level.character
	print(character.position)
	print(position)



func _on_Area2D_body_entered(body):
	var rotation_delta = rotation
	var characterPos = global_position + (character.global_position - global_position).rotated(rotation_delta)
	var normal = Vector2(0, 1).rotated(rotation)
	if characterPos.y < position.y:
		character.move_direction = character.move_direction.bounce(-normal)
	if characterPos.y > position.y:
		character.move_direction = character.move_direction.bounce(normal)
	
	pass # Replace with function body.
