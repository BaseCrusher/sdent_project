extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var level_global : Node = $"/root/LevelGlobal"
onready var character : Node = level_global.get_character_node()

var is_in_character = false
var pressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	character.connect("mouse_entered", self, "_handle_mouse_entered_character")
	character.connect("mouse_exited", self, "_handle_mouse_exited_character")
	pass # Replace with function body.

func _handle_mouse_entered_character():
	is_in_character = true
	pass

func _handle_mouse_exited_character():
	is_in_character = false
	pass

func _input(event):
	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if not is_in_character:
			if event.pressed:
				pressed = true
			if not event.pressed:
				pressed = false

	if pressed and event is InputEventMouseMotion:
		global_position -= event.relative
		pass
