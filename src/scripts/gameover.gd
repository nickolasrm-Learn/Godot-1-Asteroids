extends Node

# Whenever the Back button is pressed, return to the main menu
func _on_Back_pressed():
	get_tree().change_scene_to(load('res://src/scenes/Menu.tscn'))
