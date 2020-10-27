extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#onready var character = $"/root/LevelGlobal".get_character_node()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _draw():
	draw_circle(position, 150, Color(0.5,0.5,0.5, 0.7))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
#	if (global_position - character.position).length() <= 150:
#		character.direction_vector += (global_position - character.position).normalized() * 10
#		character.current_speed += (global_position - character.position).length() / 100 / character.VECTOR_LENGTH_TO_SPEED
#		pass
	pass
