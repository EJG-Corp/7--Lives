extends CharacterBody2D

@export var speed = 400
var gravity = 100
var acceleration = 300

func _procces(delta:float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		
	var move_input = Input.get_axis("move_left","move_right")
	velocity.x = move_toward(velocity.x,move_input*speed,acceleration*delta)
	
