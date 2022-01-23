extends VBoxContainer
class_name Menu

# Handles the play button press to change scene to Game
func _on_Play_pressed():
	get_tree().change_scene_to(load('res://src/scenes/Game.tscn'))

# Handles the exit button press to close the game
func _on_Exit_pressed():
	get_tree().quit()
