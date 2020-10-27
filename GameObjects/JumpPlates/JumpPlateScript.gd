extends Node2D
class_name JumpPlate

export(bool) var is_start_plate

onready var level_global : Node = $"/root/LevelGlobal"
onready var character : Node2D = level_global.get_character_node()

var is_active : bool = true

func _ready():
	level_global.JUMP_PLATES.append(self)
	if is_start_plate:
		level_global.start_node = self 
		character.set_position(position)


func character_entered(body : Node):
	if is_active and body is Character:
		level_global.activate_all_jump_plates()
		is_active = false
		character.speed = 0.0
		character.move_direction = Vector2.ZERO
		character.state = CharacterStates.ATTACHED_TO_PLATE
		character.position = position
	pass # Replace with function body.
