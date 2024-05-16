extends Node2D

var last_position_bullet: Vector2 = Vector2.ZERO
var can_respawn = false

var current_spawn_point

@export var spawn_point_scene: PackedScene

func set_spawn_point(position: Vector2):
	last_position_bullet = position
	can_respawn = true
	
	if current_spawn_point != null:
		current_spawn_point.queue_free()
		create_spawn_point()
	else:
		create_spawn_point()

func create_spawn_point():
	if not spawn_point_scene:
		return
		
	current_spawn_point = spawn_point_scene.instantiate()
	get_parent().add_child(current_spawn_point)
	current_spawn_point.global_position = last_position_bullet
	
	
		
