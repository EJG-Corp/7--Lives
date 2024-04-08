extends CharacterBody2D

var speed = 400
var jump_speed = 500
var gravity = 900
var acceleration = 2000


func _physics_process(delta:float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -jump_speed
		
				
	var move_input = Input.get_axis("move_left","move_right")
	velocity.x = move_toward(velocity.x,move_input*speed,acceleration*delta)
	
	move_and_slide()
