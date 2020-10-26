extends Sprite

enum CharacterState{
	standing_on_plate,
	flying
}

# Constants
const DAMPING : float = 0.97
const DIRECTION_VECTOR_MULTIPLIER : float = 1.0
const MAX_SPEED : float = 7.0
const VECTOR_LENGTH_TO_SPEED : float = 20.0

# Variables
var is_character_selected : bool = false
# Start position of character before each jump
var start_position : Vector2 
# Current speed depends on how much the player pulled the character
var current_speed : float = 0.0
# Normalized vector oposite to pulling direction muliplied by DIRECTION_VECTOR_MULTIPLIER
var direction_vector : Vector2 = Vector2.ZERO

var character_state = CharacterState.flying

# Called when the node enters the scene tree for the first time.
func _ready():
	var start_plate = get_tree().get_root().find_node("StartPlate", true, false)
	if start_plate != null:
		global_position = start_plate.global_position
	start_position = global_position
	pass # Replace with function body.


func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and get_rect().has_point(to_local(event.position)):
		if event.pressed:
			on_player_pressed()
		if not event.pressed:
			on_player_released()


func _physics_process(delta):
	if is_character_selected:
		global_position = get_global_mouse_position()
	else:
		global_position = global_position + (direction_vector * current_speed * delta)
		current_speed = current_speed * DAMPING
		if current_speed <=10e-5:
			direction_vector = Vector2.ZERO
			current_speed = 0
		start_position = global_position
		pass


func on_player_pressed():
	is_character_selected = true
	pass

func on_player_released():
	is_character_selected = false
	var temp_direction_vector = -(get_global_mouse_position()-start_position)
	direction_vector = temp_direction_vector * DIRECTION_VECTOR_MULTIPLIER
	current_speed = temp_direction_vector.length() / VECTOR_LENGTH_TO_SPEED
	if current_speed > MAX_SPEED:
		current_speed = MAX_SPEED
	pass
