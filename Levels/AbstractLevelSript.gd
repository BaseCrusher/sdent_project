extends Node2D

onready var level_global : Node = $"/root/LevelGlobal"
var JUMP_PLATES = []
var start_node : Node2D = null
var character : KinematicBody2D
var is_game_over = false
var current_level = null

func _ready():
	var scene = preload("res://GameObjects/Character/Character.tscn").instance()
	add_child(scene)
	character = scene as KinematicBody2D
	character.z_index = 10
	level_global.current_level = self
	$"./..".connect("ready", self, "calculate_bounderies")

func get_character_node() -> KinematicBody2D:
	if character == null:
		var scene = preload("res://GameObjects/Character/Character.tscn").instance()
		add_child(scene)
		character = scene as KinematicBody2D
		character.z_index = 10
		$LevelUI/LevelCamera.on_character_added(character)
	return character

func game_over():
	is_game_over = true
	character.speed = 0.0
	$LevelUI/GameOver._on_game_over()

func activate_all_jump_plates():    
	for plate in JUMP_PLATES:
		plate.is_active = true

func calculate_bounderies():
	var all_nodes = $"./..".get_children()
	all_nodes.remove(all_nodes.find(self))

	var left = 0.0
	var right = 0.0
	var top = 0.0
	var bottom = 0.0
	for node in all_nodes:
		var node_pos = node.global_position
		if node_pos.x < left:
			left = node_pos.x
		if node_pos.x > right:
			right = node_pos.x
		if node_pos.y < top:
			top = node_pos.y 
		if node_pos.y > bottom:
			bottom = node_pos.y
	left -= 500
	right+= 500
	top -= 500
	bottom += 500
	
	var upper_left = Vector2(left, top)
	var upper_right = Vector2(right, top)
	var lower_left = Vector2(left, bottom)
	var lower_right = Vector2(right, bottom)
	var scene = preload("res://GameObjects/Obstacles/BarrierObstacle.tscn")
	var left_barrier = scene.instance()
	var right_barrier = scene.instance()
	var top_barrier = scene.instance()
	var bottom_barrier = scene.instance()
	left_barrier.global_position = Vector2(left, 0)
	right_barrier.global_position = Vector2(right, 0)
	top_barrier.global_position = Vector2(0, top)
	bottom_barrier.global_position = Vector2(0, bottom)
	left_barrier.z_index = 10
	right_barrier.z_index = 10
	top_barrier.z_index = 10
	bottom_barrier.z_index = 10
	
	
	var barrier_node = left_barrier.get_child(0)
	var x_size = barrier_node.texture.get_size().x * barrier_node.scale.x
	var y_size = barrier_node.texture.get_size().y * barrier_node.scale.y
	var x_factor = -(left - right) / x_size
	var y_factor = -(top - bottom) / y_size
	
	left_barrier.global_scale = Vector2(1, y_factor)
	right_barrier.global_scale = Vector2(1, y_factor)
	top_barrier.global_scale = Vector2(x_factor, 1)
	bottom_barrier.global_scale = Vector2(x_factor, 1)
	
	add_child(left_barrier)
	add_child(right_barrier)
	add_child(top_barrier)
	add_child(bottom_barrier)
	$bg_tile.set_region_rect(Rect2(left*2, top*2, right*2, bottom*2))

