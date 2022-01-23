# Spawns asteroids over the game screen
extends Timer

export var min_delay = 2.0
export var max_delay = 10.0

var asteroid_object = load('res://src/objects/Asteroid.tscn')

# Starts spawner
func _ready():
	reset_timer()

# Resets the timer to a random value in an interval and sets it up for the next spawn
func reset_timer():
	var chosen_delay = rand_range(min_delay, max_delay)
	self.set_wait_time(chosen_delay)
	self.start()

# Spawns an asteroid randomizing its x position, and its y position (to clusterize)
func _on_Spawner_timeout():
	reset_timer()
	var asteroid = asteroid_object.instance()
	asteroid.global_position.y = rand_range(-300, -100)
	asteroid.global_position.x = rand_range(0, get_viewport().size[0])
	add_child(asteroid)
