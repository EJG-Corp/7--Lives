extends Area2D

@onready var SpikeAnimation = $AnimationPlayer
signal cat_killed

# Called when the node enters the scene tree for the first time.
func _ready():
	SpikeAnimation.play("Spike")
	
	
# Called when a body enters the Area2D
func _on_body_entered(body):
	# El jugador es un CharacterBody2D
	if body is CharacterBody2D:
		emit_signal("cat_killed")
		



