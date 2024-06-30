extends Node2D

var last_position_bullet: Vector2 = Vector2.ZERO
var can_respawn = false
@onready var spawn_point = %SpawnPoint
@export var spawn_point_scene: PackedScene
@onready var traps = $"../Traps"

var current_spawn_point


	
func _ready():
	create_spawn_point_position(spawn_point.position)
	connect_traps_signal()
	
func _process(delta):
	if Input.is_action_pressed("reset"):
		reset_level()

func connect_traps_signal():
	for child in traps.get_children():
		print(child.name)
		child.connect("cat_killed", reset_level)

func set_spawn_point(position: Vector2):
	last_position_bullet = position
	can_respawn = true
	
	if current_spawn_point != null:
		current_spawn_point.queue_free()
		create_spawn_point()
	else:
		create_spawn_point()

func create_spawn_point():
	if not spawn_point_scene:
		return
		
	current_spawn_point = spawn_point_scene.instantiate()
	get_parent().add_child(current_spawn_point)
	current_spawn_point.global_position = last_position_bullet
	
func create_spawn_point_position(position: Vector2):
	if not spawn_point_scene:
		return
		
	current_spawn_point = spawn_point_scene.instantiate()
	get_parent().add_child(current_spawn_point)
	current_spawn_point.global_position = position
	
func reset_level():
	get_tree().reload_current_scene()
	
