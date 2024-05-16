extends Area2D

var speed = 600
@export var spawn_point: PackedScene


signal bullet_collided(Vector2)
	
func _ready():
	body_entered.connect(_on_body_entered)

func _physics_process(delta):
	position += speed * transform.x * delta 
	
func _on_body_entered(body: Node2D):
	emit_signal("bullet_collided", position)
	queue_free()
