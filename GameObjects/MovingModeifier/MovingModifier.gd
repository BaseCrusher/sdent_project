extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var points = []
var moving_objects = []
var moving_to

export(float) var movement_speed = 1

var speed = 100.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var temp = get_children()
	for child in temp:
		if child is MovingModifierPoint:
			points.append(child)
		if not (child is MovingModifierPoint):
			moving_objects.append(child)
	for node in moving_objects:
		node.global_position = points[0].global_position
		
	moving_to = 1
	pass # Replace with function body.

func _physics_process(delta):
	for node in moving_objects:
		node.global_position = node.global_position.move_toward(points[moving_to].global_position, speed*movement_speed*delta)
	if moving_objects[0].global_position.distance_to(points[moving_to].global_position) <= 10e-3:
		moving_to += 1
		if moving_to >= points.size():
			moving_to = 0
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
