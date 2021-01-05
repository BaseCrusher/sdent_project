extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



export(float) var rotation_speed = 1
export(float) var rotation_from = 0
export(float) var rotation_to = 90

var is_left_rotating = true

var rotating_objects = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var temp = get_children()
	for child in temp:
		rotating_objects.append(child)
	pass # Replace with function body.

func _physics_process(delta):
	for node in rotating_objects:
		if (is_left_rotating):
			node.rotation += rotation_speed * delta
			if (node.rotation > rotation_to):
				is_left_rotating = false
		else:
			node.rotation -= rotation_speed * delta
			if (node.rotation < rotation_from):
				is_left_rotating = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
