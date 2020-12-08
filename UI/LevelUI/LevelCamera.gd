extends Camera2D

onready var current_level : Node
onready var character : Node
onready var ui_node : Node = $"./.."

var is_in_character = false
var pressed = false

var target_zoom = Vector2(1, 1)
const zoom_amount = 0.15
const zoom_speed = 5.0
const min_zoom = Vector2(1, 1)
var max_zoom = Vector2(10, 10)

func _ready():
	$"./../..".connect("ready", self, "_on_finished_level_loading")
	zoom = $"/root/LevelGlobal".zoom_level
	target_zoom = $"/root/LevelGlobal".zoom_level


func _on_finished_level_loading():
	current_level = $"./../.."
	character = current_level.character
	character.connect("mouse_entered", self, "_handle_mouse_entered_character")
	character.connect("mouse_exited", self, "_handle_mouse_exited_character")



func _handle_mouse_entered_character():
	is_in_character = true


func _handle_mouse_exited_character():
	is_in_character = false


func _process(delta):
	zoom = lerp(zoom, target_zoom, delta * zoom_speed)


func _input(event):
	if current_level != null and not current_level.is_game_over:
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
			if not is_in_character:
				if event.pressed:
					pressed = true
				if not event.pressed:
					pressed = false

		if pressed and event is InputEventMouseMotion:
			global_position -= event.relative
			if global_position.x < limit_left + (get_viewport().size.x/2):
				global_position.x = limit_left + (get_viewport().size.x/2)
			if global_position.x > limit_right - (get_viewport().size.x/2):
				global_position.x = limit_right - (get_viewport().size.x/2)
			if global_position.y < limit_top + (get_viewport().size.y/2):
				global_position.y = limit_top + (get_viewport().size.y/2)
			if global_position.y > limit_bottom - (get_viewport().size.y/2):
				global_position.y = limit_bottom - (get_viewport().size.y/2)
			
		if event is InputEventMouseButton and event.button_index == BUTTON_WHEEL_UP:
			target_zoom -= Vector2(zoom_amount, zoom_amount)
			$"/root/LevelGlobal".zoom_level = target_zoom
			if target_zoom < min_zoom:
				target_zoom = min_zoom
			pass
		
		if event is InputEventMouseButton and event.button_index == BUTTON_WHEEL_DOWN:
			target_zoom += Vector2(zoom_amount, zoom_amount)
			$"/root/LevelGlobal".zoom_level = target_zoom
			if target_zoom > max_zoom:
				target_zoom = max_zoom
			pass
		
