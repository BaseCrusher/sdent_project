extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BackBtn_pressed():
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")


func _on_Lvl1Btn_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_Lvl2Btn_pressed():
	get_tree().change_scene("res://Levels/Level2.tscn")


func _on_Lvl3Btn_pressed():
	get_tree().change_scene("res://Levels/Level3.tscn")


func _on_Lvl4Btn_pressed():
	get_tree().change_scene("res://Levels/Level4.tscn")
