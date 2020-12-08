extends Sprite
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
		texture = load("res://resources/images/startplate.png")
	if is_end_plate:
		texture = load("res://resources/images/endplate.png")
		pass


func character_entered(body : Node):
	if is_end_plate:
		current_level.level_completed()
		
	if is_active and body is Character:
		current_level.activate_all_jump_plates()
		is_active = false
		character.state = CharacterStates.ATTACHING_TO_PLATE
		character.attaching_to_plate = self
		#character.speed = 0.0
		#character.move_direction = Vector2.ZERO
		#character.state = CharacterStates.ATTACHED_TO_PLATE
		#character.global_position = position
	pass # Replace with function body.
