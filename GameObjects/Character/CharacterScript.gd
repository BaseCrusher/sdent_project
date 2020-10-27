extends KinematicBody2D
class_name Character

# Constants
const DAMPING : float = 0.97
const DIRECTION_VECTOR_MULTIPLIER : float = 1.0
const MAX_SPEED : float = 7.0
const MAX_PULL_LENGTH : float = 300.0
const VECTOR_LENGTH_TO_SPEED : float = 20.0

# Variables
var is_selected : bool = false
var start_pos : Vector2
var move_direction : Vector2 = Vector2.ZERO
var speed : float = 0.0
var state : int = CharacterStates.ATTACHED_TO_PLATE
# Offset between mouse and character center. Needed for better pull mechanic
var grabbed_offset = Vector2()

onready var level_global : Node = $"/root/LevelGlobal"


func _ready():
	start_pos = position


func set_position(new_position : Vector2) -> void:
	position = new_position
	start_pos = position


func _input(event):
	if is_selected and event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		handle_releasing()


func _input_event(_viewport, event, _shape_idx):
	if state == CharacterStates.ATTACHED_TO_PLATE and event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		handle_pulling()


func _physics_process(delta):
	if is_selected:
		# Move character with mouse
		
		# TODO: Check if offset needt to be added before or after set length.
		var temp_position = get_global_mouse_position() - start_pos + grabbed_offset
		if temp_position.length() >= MAX_PULL_LENGTH:
			temp_position = temp_position.clamped(MAX_PULL_LENGTH)
		position = start_pos + temp_position
	else:
		# Move character when mouse released
		position = position + (move_direction * speed * delta)
		speed *= DAMPING
		if speed <=10e-5:
			move_direction = Vector2.ZERO
			speed = 0
		start_pos = global_position
		pass


func handle_pulling():
	is_selected = true
	grabbed_offset = position - get_global_mouse_position()
	pass


func handle_releasing():
	is_selected = false
	state = CharacterStates.FLYING
	var distance = position.distance_to(start_pos)
	move_direction = position.direction_to(start_pos) * distance * DIRECTION_VECTOR_MULTIPLIER
	speed = distance / VECTOR_LENGTH_TO_SPEED
	if speed > MAX_SPEED:
		speed = MAX_SPEED
	pass








