extends Node2D


@export var cats: Array[PackedScene] = []
@onready var spawn_point = %SpawnPoint
@onready var level_controller = %LevelController
@onready var camera_transition_manager = %CameraTransitionManager


var current_cat_index = 0
var current_cat

func _ready():
	# Spawn first cat: Archer 
	var next_cat = cats[0]
	var cat_instance = next_cat.instantiate()
	add_child(cat_instance)
	_handle_cat_instance(cat_instance, spawn_point.global_position)

func handle_cat_die():
	
	# Disable cursor current cat
	current_cat.get_node("Cursor").disable_cursor()
	current_cat_index = current_cat_index + 1 # We need other cat!
	# Instance other cat	
	var next_cat: PackedScene = cats[current_cat_index]
	# Spawn the next cat and transition camera
	
	# Instance cat
	var cat_instance = next_cat.instantiate()
	add_child(cat_instance)
	transition_camera_between_cats(current_cat.get_camera2d(), cat_instance.get_camera2d())
	_handle_cat_instance(cat_instance, level_controller.current_spawn_point.position)

	
func bullet_colided(position):
	level_controller.set_spawn_point(position)
	
func _handle_cat_instance(cat_instance, position: Vector2):
	current_cat = cat_instance

	current_cat.cat_died.connect(handle_cat_die)
	current_cat.get_node("Cursor").bullet_collided_cat.connect(bullet_colided)
	
	# Position and Rotation
	current_cat.global_position = position
	current_cat.rotation = 0


func transition_camera_between_cats(from_camera, to_camera):
	print("from camera")
	print(from_camera.global_position)
	print("to camera")
	print(to_camera.global_position)
	camera_transition_manager.transition_camera2D(from_camera, to_camera)

	

