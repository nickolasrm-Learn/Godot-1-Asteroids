# Used by spaceship as a position reference of
# where the bullet should be spawned. it also handles
# the shoot input and instantiation processes

extends Node2D
class_name Gun

# Bullet class
var Bullet = load('res://src/objects/Bullet.tscn')

# Detects when the user pressed the shoot button
func _unhandled_input(event):
	if event.is_action_pressed('shoot'):
		spawn_bullet()

# Spawns a bullet in the same position as this object
func spawn_bullet():
	var bullet = Bullet.instance()
	bullet.global_position = self.global_position
	get_viewport().add_child(bullet)
