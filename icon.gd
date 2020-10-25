extends Sprite


var is_player_selected : bool = false

var start_position
var movement_direction = Vector2.ZERO
var speed = 0

var direction_vector= Vector2.ZERO
var manipulation_vector = Vector2(0, 0)
var velocity = Vector2.ZERO

const SPRING_CONSTANT = 0.4
const DAMPING = 0.97

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		on_player_pressed()
		pass
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		on_player_released()
		pass
	pass # Replace with function body.
	
func _physics_process(delta):
	if is_player_selected:
		global_position = get_global_mouse_position()
	else:
		global_position = global_position + ((direction_vector + manipulation_vector ) * speed * delta)
		speed = speed * DAMPING
		if speed <=10e-5:
			speed = 0
		start_position = global_position
		pass

func on_player_pressed():
	is_player_selected = true
	pass

func on_player_released():
	is_player_selected = false
	direction_vector = -(get_global_mouse_position()-start_position)
	var direction = direction_vector.normalized()
	speed = direction_vector.length() / 20
	if speed > 7:
		speed = 7
	pass
