# Object that can kill the player
class_name Asteroid
extends Node2D

export var fall_speed = 200.0
export var rotation_speed = 50.0

var scored = false

var Explosion = load('res://src/effects/Explosion.tscn')

# Randomizes its starting rotation
func _ready():
	self.rotation_degrees = rand_range(0.0, 360.0)

# Moves asteroid and rotates it
func _physics_process(delta: float):
	update_position(delta)
	update_rotation(delta)
	
# Moves the asteroid and removes it if out of screen
func update_position(delta: float):
	if (self.global_position.y - 100) > get_viewport().size[1]:
		Globals.die()
		queue_free()
	else:
		self.position.y += fall_speed * delta

# Rotates the asteroid
func update_rotation(delta: float):
	self.rotation_degrees += rotation_speed * delta

# Collided with a bullet or a player
func _on_Asteroid_area_entered(area):
	score()
	explode()
	queue_free()
	
# Executes the death animation
func explode():
	var explosion = Explosion.instance()
	explosion.global_position = self.global_position
	get_viewport().add_child(explosion)
	
# Increases the player score
func score():
	if not scored: # scored is used to avoid double bullets destroying an asteroid
		Globals.score(1)
		scored = true
