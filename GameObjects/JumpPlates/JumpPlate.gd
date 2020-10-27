extends Position2D

const PLATE_RADIUS = 50
onready var global = $"/root/LevelGlobal"
onready var character = global.get_character_node()

var is_active = true

func _ready():
	global.add_to_jump_plates(self)
	pass 

func _physics_process(delta):
#	if is_active and character.character_state == character.CharacterState.flying:
#		if character.global_position.distance_to(global_position) <= PLATE_RADIUS:
#			global.activate_all_jump_plates()
#			is_active = false
#			character.direction_vector = Vector2.ZERO
#			character.current_speed =  0.0
#			character.global_position = global_position
#		pass
	pass
