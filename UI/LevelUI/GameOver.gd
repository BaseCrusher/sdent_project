extends CanvasLayer

func _on_game_over():
	$GameOver.visible = true

func _on_TryAgainBtn_pressed():
	get_tree().reload_current_scene()


func _on_ChooseLvlBtn_pressed():
	$"/root/LevelGlobal".zoom_level = Vector2(1,1)
	get_tree().change_scene("res://UI/LevelMenu/ChooseLvlMenu.tscn")


func _on_MainMenuBtn_pressed():
	$"/root/LevelGlobal".zoom_level = Vector2(1,1)
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")


func _on_ExitBtn_pressed():
	get_tree().quit()
