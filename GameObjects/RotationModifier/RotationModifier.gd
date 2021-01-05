extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



export(float) var rotation_speed = 1
export(float) var rotation_from = 0
export(float) var rotation_to = 90

export(bool) var is_right_rotating = true

var rotating_objects = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var temp = get_children()
	for child in temp:
		rotating_objects.append(child)
	pass # Replace with function body.

func _physics_process(delta):
	for node in rotating_objects:
		if rotation_from != rotation_to:
			if (is_right_rotating):
				node.rotation += rotation_speed * delta
				if (node.rotation_degrees > rotation_to):
					is_right_rotating = false
			else:
				node.rotation -= rotation_speed * delta
				if (node.rotation_degrees < rotation_from):
					is_right_rotating = true
		else:
			if (is_right_rotating):
				node.rotation += rotation_speed * delta
			else:
				node.rotation -= rotation_speed * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
