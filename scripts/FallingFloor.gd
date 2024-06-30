extends Node2D

# Variables de referencia a los nodos
@onready var anim_player = $AnimationPlayer


func _on_area_2d_body_entered(body):
	
	# Debuggin 
	if body is StaticBody2D :
		pass
		
	# Debuggin
	print("Falling Floor Colisionando con : ", body.name)
	
	# El player es un CharacterBody2D .
	if body is CharacterBody2D:
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
