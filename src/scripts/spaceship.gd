class_name Spaceship
extends Node2D

# speed the player goes left or right
export var move_speed = 200.0

var current_speed = 0.0

# Explosion class
var Explosion = load('res://src/effects/Explosion.tscn')

# Whenever the player loses all its lives, the game finishes
func _process(delta):
	if Globals.get_lives() == 0:
		die()

# Updates each physics step related to the player
#
# delta is a value used to fix timed operations. it can be used by multiplying any
# units by it. this value is necessary because different CPUs can handle the same 
# operation in non equal times. Also, the same CPU can have different times processing 
# the same action. Thus, delta is the calculated portion of real time elapsed between
# frames, which serves as a fixer for continous actions, such as moving, rotating...
func _physics_process(delta: float):
	update_input()
	update_position(delta)

# Detects for user inputs and handles it modifying the velocity of the player
func update_input():
	if Input.is_action_pressed("turn_left"):
		current_speed = -move_speed
	elif Input.is_action_just_released("turn_left"):
		current_speed = 0
				
	if Input.is_action_pressed("turn_right"):
		current_speed = min(current_speed + move_speed, move_speed) # fixes key priority
	elif Input.is_action_just_released("turn_right"):
		current_speed = 0

# Updates the position of a player if an input previously changed
# its variable
func update_position(delta: float):
	self.position.x = max(
						min(self.position.x + current_speed * delta,
							get_viewport().size[0]), 
						0)

# Executes dying animation, removes the object, and then changes the scene
func die():
	explode()
	queue_free()
	get_tree().change_scene_to(load('res://src/scenes/GameOver.tscn'))

# Collided with an asteroid
func _on_Spaceship_area_entered(area):
	die()

# Executes the ship dying animation
func explode():
	var explosion = Explosion.instance()
	explosion.global_position = self.global_position
	get_viewport().add_child(explosion)
