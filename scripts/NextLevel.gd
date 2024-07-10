extends Node2D

@onready var crunch : AudioStreamPlayer2D = get_node("Crunch")
@onready var Sprite : Sprite2D = get_node("Area2D/Sprite2D")
@onready var EscenaActual : String = get_tree (). get_current_scene (). get_name ()


func _ready():
	# Hace que la meta oscile de arriba hacia abajo
	$AnimationPlayer.play("Move")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	Sprite.visible = false
	crunch.play()
	await get_tree().create_timer(0.5).timeout
	
	if body is CharacterBody2D:
		# Cambiamos escena al siguiente nivel
		var NextLevelLocation : String = "res://scenes/Levels/" + increment_level(EscenaActual) + ".tscn"
		get_tree().change_scene_to_file(NextLevelLocation)	

# Crear el string para el siguiente Level 
func increment_level(level_name: String) -> String:
	# Suponemos que el formato del nombre del nivel es "Level-X" donde X es un número.
	# Dividimos la cadena por el guion
	var parts = level_name.split("-")
	if parts.size() == 2:
		var level_number = parts[1].to_int()  
		level_number += 1 
		var new_level_name = parts[0] + "-" + str(level_number)  
		if level_number == 7:
			new_level_name = "Creditos"

		return new_level_name
	return level_name  
