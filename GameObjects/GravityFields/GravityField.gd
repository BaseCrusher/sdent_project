extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(bool) var is_pulling = false
var is_in_gravity: bool = false
onready var level_global : Node = $"/root/LevelGlobal"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	if is_in_gravity:
		if is_pulling:
			level_global.character.move_direction += (global_position - level_global.character.position).normalized() * 20
		else:
			level_global.character.move_direction -= (global_position - level_global.character.position).normalized() * 20
		level_global.character.speed += (global_position - level_global.character.position).length() / 100 / level_global.character.VECTOR_LENGTH_TO_SPEED
		pass
	pass
	
	


func _on_Area2D_body_entered(body):
	is_in_gravity = true
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	is_in_gravity = false
	pass # Replace with function body.
