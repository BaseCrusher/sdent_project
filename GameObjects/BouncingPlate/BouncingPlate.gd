extends Node2D
class_name BouncingPlate

var current_level
var character : Character


func _ready():
	current_level = $"/root/LevelGlobal".current_level
	character = current_level.character
	print(character.position)
	print(position)

func _physics_process(delta):
	
	pass



func _on_Area2D_body_entered(body):
	var rotation_delta = rotation
	
	
	pass # Replace with function body.
