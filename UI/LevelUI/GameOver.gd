extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
onready var level_global : Node = $"/root/LevelGlobal"

func _ready():
	level_global.connect("game_over", self, "_on_game_over")
	level_global.connect("level_loaded", self, "_on_level_loaded")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_level_loaded():
	$GameOver.visible = false
	pass

func _on_game_over():
	$GameOver.visible = true
	pass

func _on_TryAgainBtn_pressed():
	level_global.current_level.reset()
	pass # Replace with function body.


func _on_ChooseLvlBtn_pressed():
	get_tree().change_scene("res://UI/LevelMenu/ChooseLvlMenu.tscn")
	level_global.remove_character()


func _on_MainMenuBtn_pressed():
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")
	level_global.remove_character()


func _on_ExitBtn_pressed():
	get_tree().quit()
