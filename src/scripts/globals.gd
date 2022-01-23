# Stores all variables used by the entire project ignoring
# scene hierarchy

extends Node

var score = 0
var lives = 3

# Increases the score variable
func score(value: int):
	score += value

# Returns the score
func get_score() -> int:
	return score

# Decreases the number of lives
func die():
	lives = max(lives-1, 0)

# Returns the number of lives
func get_lives() -> int:
	return lives

# Resets the number of lives to its default value
func reset_lives():
	lives = 3

# Resets the score number to its initial value
func reset_score():
	score = 0
