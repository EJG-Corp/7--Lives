extends Node2D


func _ready():
	# Hace que la meta oscile de arriba hacia abajo
	$AnimationPlayer.play("Move")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	
	if body is CharacterBody2D:
		get_tree().change_scene_to_file("res://scenes/Levels/Level-2.tscn")	

