extends KinematicBody2D
class_name Character

# Constants
const DAMPING : float = 0.97
const DIRECTION_VECTOR_MULTIPLIER : float = 1.0
const MAX_SPEED : float = 7.0
const MAX_PULL_LENGTH : float = 300.0
const MIN_PULL_LENGTH : float = 50.0
const VECTOR_LENGTH_TO_SPEED : float = 20.0

# Variables
var is_selected : bool = false
var start_pos : Vector2
var move_direction : Vector2 = Vector2.ZERO
var speed : float = 0.0
var state : int = CharacterStates.ATTACHED_TO_PLATE
var current_level
# Offset between mouse and character center. Needed for better pull mechanic
var grabbed_offset = Vector2()

var attaching_to_plate = null 

func _ready():
	$"./..".connect("ready", self, "_on_finished_level_loading")


func _on_finished_level_loading():
	current_level = $"/root/LevelGlobal".current_level
	start_pos = global_position

func set_position(new_position : Vector2) -> void:
	global_position = new_position
	start_pos = global_position


func _input(event):
	if is_selected and event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		handle_releasing()


func _input_event(_viewport, event, _shape_idx):
	if state == CharacterStates.ATTACHED_TO_PLATE and event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		handle_pulling()


func _physics_process(delta):
	if current_level != null and not current_level.is_game_over:
		if speed == 0 and state != CharacterStates.ATTACHED_TO_PLATE and state != CharacterStates.ATTACHING_TO_PLATE:
			current_level.game_over()
			
		if is_selected:
			# TODO: Check if offset needt to be added before or after set length.
			var temp_position = get_global_mouse_position() - start_pos + grabbed_offset
			if temp_position.length() >= MAX_PULL_LENGTH:
				temp_position = temp_position.clamped(MAX_PULL_LENGTH)
			global_position = start_pos + temp_position
		else:
			# Move character when mouse released
			global_position = global_position + (move_direction * speed * delta)
			speed *= DAMPING
			if speed <=10e-3:
				move_direction = Vector2.ZERO
				speed = 0
			start_pos = global_position
			pass
		
		if state == CharacterStates.ATTACHING_TO_PLATE:
			move_direction += (attaching_to_plate.global_position - global_position).normalized().tangent()
			move_direction += (attaching_to_plate.global_position - global_position)
			if speed >= 1.0:
				speed *= 0.8
			if speed == 0:
				global_position = global_position.move_toward(attaching_to_plate.global_position, delta * 50)
			if global_position.distance_to(attaching_to_plate.global_position) <= 10e-3:
				state = CharacterStates.ATTACHED_TO_PLATE
				speed = 0
				move_direction = Vector2.ZERO


func handle_pulling():
	is_selected = true
	grabbed_offset = global_position - get_global_mouse_position()
	pass


func handle_releasing():
	is_selected = false
	var distance = global_position.distance_to(start_pos)
	if distance > MIN_PULL_LENGTH:
		state = CharacterStates.FLYING
		move_direction = global_position.direction_to(start_pos) * distance * DIRECTION_VECTOR_MULTIPLIER
		speed = distance / VECTOR_LENGTH_TO_SPEED
		if speed > MAX_SPEED:
			speed = MAX_SPEED
	else:
		global_position = start_pos









