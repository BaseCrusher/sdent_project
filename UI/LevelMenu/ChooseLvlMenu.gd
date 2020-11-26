extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var numberOfScenes = get_number_of_scenes()

var button_node=preload("res://UI/LevelMenu/ButtonEScene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(numberOfScenes): #example instantiate 6 times
		var temp=button_node.instance()
		temp.set_position(Vector2(200*i , 50)) #use i to change y position
		temp.name= "LvlBtn"+str(i+1) #custom name, ej: panel1,panel2, etc
		add_child(temp) 


func get_number_of_scenes():
	var counter = -1 # -1 because of the global level
	var dir = Directory.new()
	dir.open("res://Levels")
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif file.get_extension() == "tscn":
			counter += 1

	dir.list_dir_end()
	print(counter)
	return counter

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BackBtn_pressed():
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")


func _on_Lvl1Btn_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")
