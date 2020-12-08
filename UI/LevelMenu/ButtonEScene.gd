extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var number

# Called when the node enters the scene tree for the first time.
func _ready():

	number = name.length() -1
	
	$Button.text = str(name[number])	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Levels/Level" + name[number] + ".tscn")
	pass # Replace with function body.
