extends Label
class_name LivesCounter

# Updates the number of lives of a text
func _process(delta):
	self.text = 'Live: %s' % Globals.get_lives()
