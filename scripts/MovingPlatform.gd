extends Node2D

var speed = 1.0

@onready var path : PathFollow2D = get_node("Path2D/PathFollow2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Move")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path.progress_ratio += delta * speed


