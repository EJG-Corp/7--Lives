extends Area2D

@onready var SpikeAnimation = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	SpikeAnimation.play("Spike")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Called when a body enters the Area2D
func _on_body_entered(body):
	# El jugador es un CharacterBody2D
	if body is CharacterBody2D:
		print("Colisionando con: ", body.name)
		# Capturamos el animation Tree del jugador
		var player_animation_tree = body.get_node("AnimationTree")
		var state_machine = player_animation_tree.get("parameters/playback")
		# Esto no esta funcionando
		state_machine.travel("Die")

