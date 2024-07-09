extends Node2D

@onready var CurrentCat : String = "" 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var PlayerController : Node2D = get_node("PlayerController")
	if PlayerController :
		for child in PlayerController.get_children():
				if child is CharacterBody2D:
					CurrentCat = child.name
	print(CurrentCat)
	pass




# Reiniciar el nivel cuando el jugador cae al vacio
func _on_limite_inferior_body_entered(body):
	if body.name == CurrentCat:
		get_tree().reload_current_scene()
		
