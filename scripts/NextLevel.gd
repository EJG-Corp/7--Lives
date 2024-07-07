extends Node2D

@onready var crunch : AudioStreamPlayer2D = get_node("Crunch")
@onready var Sprite : Sprite2D = get_node("Area2D/Sprite2D")
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
		
		get_tree().change_scene_to_file("res://scenes/Levels/Level-2.tscn")	

