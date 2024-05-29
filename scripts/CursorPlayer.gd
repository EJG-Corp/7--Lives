extends Sprite2D

@export var radius = 100
@onready var player: CharacterBody2D = $".."

@export var bullet_scene: PackedScene

var angle : float = 0 
var rotation_speed = 12.0
var was_aim_pressed = false

var coordinate_bullet: Vector2 = Vector2.ZERO
var angle_to_player

signal bullet_collided_cat(Vector2)

func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	visible = false
	
func _process(delta):
	if Input.is_action_pressed("aim"):
		was_aim_pressed = true
		visible = true
		show_cursor_aim(delta)
	elif was_aim_pressed:
		was_aim_pressed = false
		visible = false
		spawn_bullet()

func disable_cursor():
	queue_free()
	
func spawn_bullet():
	if not bullet_scene:
		return
	var bullet = bullet_scene.instantiate()
	get_tree().get_root().add_child(bullet)
	bullet.bullet_collided.connect(_on_bullet_collided)
	
	# Position and Rotation
	print(coordinate_bullet)
	if coordinate_bullet != Vector2.ZERO:
		bullet.global_position = coordinate_bullet
	
	bullet.rotation = angle_to_player
	
func _on_bullet_collided(position):
	emit_signal("bullet_collided_cat", position)


func show_cursor_aim(delta): 
	# Position Player and Mouse
	var player_pos = player.position
	var mouse_pos: Vector2 = get_global_mouse_position()
	
	var direction = mouse_pos - player_pos
	direction = direction.normalized()
	
	# Magic
	angle_to_player = atan2(direction.y, direction.x)
	angle_to_player += rotation_speed * delta

	# Get the coordinates
	var x = radius * cos(angle_to_player)
	var y = radius * sin(angle_to_player)
	
	var cursor_position = Vector2(x,y)
	position = cursor_position
	
	coordinate_bullet = player.position + cursor_position
	
	


