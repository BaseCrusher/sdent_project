extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const CIRCLE_SIZE = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _draw():
	draw_circle(position, CIRCLE_SIZE, Color("84FFF2"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
