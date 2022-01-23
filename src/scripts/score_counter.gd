extends Label
class_name ScoreCounter

# Updates a label with the global score
func _process(delta):
	self.text = 'Score: %s' % Globals.get_score()
