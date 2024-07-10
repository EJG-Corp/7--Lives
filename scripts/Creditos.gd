extends Node2D

@onready var Animacion : AnimationPlayer = get_node("AnimationPlayer")
@onready var Musica : AudioStreamPlayer2D = get_node("AudioStreamPlayer2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	Animacion.play("Creditos")
	Musica.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
