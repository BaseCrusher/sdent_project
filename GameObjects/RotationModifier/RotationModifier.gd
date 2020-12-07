extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(float) var rotation_speed = 1

var rotating_objects = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var temp = get_children()
	for child in temp:
		rotating_objects.append(child)
	pass # Replace with function body.

func _physics_process(delta):
	for node in rotating_objects:
		node.rotation += rotation_speed * delta
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
