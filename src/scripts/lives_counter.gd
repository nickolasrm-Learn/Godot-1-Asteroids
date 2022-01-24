extends Label
class_name LivesCounter

# Updates the number of lives of a text
func _process(delta):
	self.text = 'Lives: %s' % Globals.get_lives()
