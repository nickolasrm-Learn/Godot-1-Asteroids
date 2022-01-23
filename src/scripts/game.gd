extends Node

# Resets all global variables modified in the last gameplay
func _ready():
	Globals.reset_lives()
	Globals.reset_score()
