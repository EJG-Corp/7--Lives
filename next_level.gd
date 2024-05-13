extends Area2D

var entered = false

func _on_body_entered(_body : PhysicsBody2D):
	entered = true
	pass # Replace with function body.


func _on_body_exited(_body):
	entered = false


func _process(_delta):
	if entered == true:
		# Si queremos cambiar presionando un boton usar esta condicion
		#if Input.is_action_just_pressed("move_left"):
		get_tree().change_scene_to_file("res://level_2.tscn")
