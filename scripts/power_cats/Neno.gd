extends "res://scripts/MovementPlayer.gd"

const wall_jump_pushback = 100
const wall_slide_gravity = 100
 
func jump():
	# Jump Input
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump_speed
		elif is_on_wall_only():
			velocity = Vector2(get_wall_normal().x * wall_jump_pushback, -jump_speed)
	if is_on_wall_only() and Input.get_axis("move_left", "move_right"):  
		velocity.y = min(velocity.y, wall_slide_gravity)  # if you calculate gravity (velocity.y) in _physics_process, you don't need to do it again
