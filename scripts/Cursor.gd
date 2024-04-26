extends Sprite2D

@export var radius = 100
@onready var player: CharacterBody2D = $"../Player"

var angle : float = 0 
var rotation_speed = 12.0
 
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _process(delta):
	if Input.is_action_pressed("aim"):
		visible = true
		show_cursor_aim(delta)
	else:
		visible = false

func show_cursor_aim(delta): 
	# Posicion player y mouse
	var player_pos = player.position
	var mouse_pos: Vector2 = get_global_mouse_position()
	
	var direction = mouse_pos - player_pos
	direction = direction.normalized()
	
	# Magia matematica
	var angle_to_player = atan2(direction.y, direction.x)
	angle_to_player += rotation_speed * delta

	# Obtenemos coordenadas
	var x = player_pos.x + radius * cos(angle_to_player)
	var y = player_pos.y + radius * sin(angle_to_player)
	
	position = Vector2(x, y)

