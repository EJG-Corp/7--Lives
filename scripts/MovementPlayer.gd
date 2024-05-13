extends CharacterBody2D

var speed = 300
var jump_speed = 300
var gravity = 800
var acceleration = 2000

@onready var pivot : Node2D = %Pivot
@onready var animation_tree: AnimationTree = %AnimationTree
@onready var playback = animation_tree.get("parameters/playback")

func _physics_process(delta:float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -jump_speed
					
	var move_input = Input.get_axis("move_left","move_right")
	velocity.x = move_toward(velocity.x,move_input*speed,acceleration*delta)
	
	
	handle_animation(move_input)
	move_and_slide()


func handle_animation(move_input):
	if is_on_floor():
		
		if abs(velocity.x) > 10 or move_input != 0:
			playback.travel("Run")
		else:
			playback.travel("Idle")
		
		if move_input :
			pivot.scale.x = sign(move_input)
	
	else:
		if velocity.y < 0 :
			playback.travel("Jump")
		elif velocity.y > 0 :
			playback.travel("Falling")
