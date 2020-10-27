extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var global = $"/root/LevelGlobal"
#onready var character = global.get_character_node()

var pressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
#		print(event.position)
#		if not character.get_rect().has_point(to_global(event.position)):
#			if event.pressed:
#				pressed = true
#			if not event.pressed:
#				pressed = false
	
#	if pressed and event is InputEventMouseMotion:
#		global_position -= event.relative
		pass
