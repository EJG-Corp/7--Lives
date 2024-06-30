extends Area2D
signal cat_killed

# Called when a body enters the Area2D
func _on_body_entered(body):
	# El jugador es un CharacterBody2D
	if body is CharacterBody2D:
		print("matando gato")
		emit_signal("cat_killed")
