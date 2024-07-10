extends Node2D

@onready var FireAnimation = $AnimationPlayer
signal cat_killed

# Called when the node enters the scene tree for the first time.
func _ready():
	FireAnimation.play("Fire")


func _on_fire_body_entered(body):
	# El jugador es un CharacterBody2D
	if body is CharacterBody2D:
		print(body.name)
		emit_signal("cat_killed")
