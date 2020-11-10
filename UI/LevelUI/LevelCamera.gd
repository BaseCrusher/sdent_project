extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var level_global : Node = $"/root/LevelGlobal"
onready var character : Node = level_global.get_character_node()

var is_in_character = false
var pressed = false

var target_zoom = Vector2(1, 1)
const zoom_amount = 0.15
const zoom_speed = 5.0
const min_zoom = Vector2(1, 1)
var max_zoom = Vector2(10, 10)

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

func _process(delta):
	zoom = lerp(zoom, target_zoom, delta * zoom_speed)
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
		
	if event is InputEventMouseButton and event.button_index == BUTTON_WHEEL_UP:
		target_zoom -= Vector2(zoom_amount, zoom_amount)
		if target_zoom < min_zoom:
			target_zoom = min_zoom
		pass
	
	if event is InputEventMouseButton and event.button_index == BUTTON_WHEEL_DOWN:
		target_zoom += Vector2(zoom_amount, zoom_amount)
		if target_zoom > max_zoom:
			target_zoom = max_zoom
		pass
