extends Node2D


@export var cats: Array[PackedScene] = []
@onready var spawn_point = %SpawnPoint
@onready var level_controller = %LevelController


var current_cat_index = 0
var current_cat

func _ready():
	# Spawn first cat: Archer 
	var cat_scene = cats[0]
	_spawn_cat(cat_scene, spawn_point.global_position)

func handle_cat_die():
	# Current cat
	current_cat.disable_camera()
	# Disable cursor
	current_cat.get_node("Cursor").disable_cursor()
	current_cat_index = current_cat_index + 1 # We need other cat!
	# Instance other cat
	var next_cat_scene = cats[current_cat_index]
	_spawn_cat(next_cat_scene, level_controller.current_spawn_point.position)
	
func bullet_colided(position):
	level_controller.set_spawn_point(position)
	
func _spawn_cat(cat_scene: PackedScene, position: Vector2):
	current_cat = cat_scene.instantiate()
	add_child(current_cat)
	
	current_cat.cat_died.connect(handle_cat_die)
	current_cat.get_node("Cursor").bullet_collided_cat.connect(bullet_colided)
	
	# Position and Rotation
	current_cat.global_position = position
	current_cat.rotation = 0
