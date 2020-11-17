extends Node2D
class_name JumpPlate

export(bool) var is_start_plate
export(bool) var is_end_plate

onready var current_level : Node
onready var character : Node2D

var is_active : bool = true

func _ready():
	current_level = $"/root/LevelGlobal".current_level
	character = current_level.character
	current_level.JUMP_PLATES.append(self)
	if is_start_plate:
		current_level.start_node = self 
		character.set_position(self.position)


func character_entered(body : Node):
	if is_end_plate:
		print("bla")
		
	if is_active and body is Character:
		current_level.activate_all_jump_plates()
		is_active = false
		character.speed = 0.0
		character.move_direction = Vector2.ZERO
		character.state = CharacterStates.ATTACHED_TO_PLATE
		character.global_position = position
	pass # Replace with function body.
