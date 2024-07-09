extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




# Reiniciar el nivel cuando el jugador cae al vacio
func _on_limite_inferior_body_entered(body):
	if body is CharacterBody2D:
		get_tree().reload_current_scene()
		
