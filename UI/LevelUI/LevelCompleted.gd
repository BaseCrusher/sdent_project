extends CanvasLayer


func _on_level_completed():
	$LevelCompleted.visible = true
	
	var lastlvl = get_tree().current_scene.name
	if lastlvl == "Level4":
		
		$LevelCompleted/GridContainer/NextLvlBtn.visible = false


func _on_NextLvlBtn_pressed():
	
	var nextLvl = get_tree().current_scene.name
	nextLvl.erase(0,5)
	nextLvl = int(nextLvl)
	nextLvl += 1
	nextLvl = String(nextLvl)
	get_tree().change_scene("res://Levels/Level" + nextLvl + ".tscn")
	



func _on_MainMenuBtn_pressed():
	get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")
