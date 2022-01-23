# Projectile that can destroy asteroids
extends Node

export var speed = 700.0

# Moves the bullet or deletes it if out of screen
func _physics_process(delta):
	update_position(delta)
	if self.global_position.y < 0:
		queue_free()

# Updates the position of the bullet
func update_position(delta):
	self.position.y -= speed * delta

# Collided with an asteroid
func _on_Bullet_area_entered(area):
	queue_free()
