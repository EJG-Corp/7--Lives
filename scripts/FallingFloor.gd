extends Node2D

# Variables de referencia a los nodos
@onready var anim_player = $AnimationPlayer


func _on_area_2d_body_entered(body):
	
	if body is StaticBody2D :
		pass
	# Not working
	print("Colisionando con :")
	print(body.name)
	# En que grupo deberia estar el jugador ? Llamar a la variable global cats ?
	if body is CharacterBody2D:
		print("Player dead")
		anim_player.play("FallingFloor")
		await anim_player.animation_finished
		# Destruimos la instancia de este piso porque no se regenera
		$Area2D.queue_free()
		$StaticBody2D.queue_free()
		
# Función ready
func _ready():
	pass

func _process(delta):
	pass
