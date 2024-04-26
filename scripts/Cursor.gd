extends Sprite2D

@export var radius = 100

@onready var player: CharacterBody2D = $"../Player"
var last_position_inside: Vector2 

func _ready():
	pass
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# Internal variables
var angle : float = 0  # Current angle of rotation in radians
var rotation_speed = 12.0  # Adjust this value as needed

func _process(delta):
	if Input.is_action_pressed("aim"):
		visible = true
		show_cursor_aim(delta)
	else:
		visible = false

		


func show_cursor_aim(delta): 
		# Get the position of the player
	var player_pos = player.position
	var mouse_pos: Vector2 = get_global_mouse_position()
	# Calculate the direction from the player to this object
	var direction = mouse_pos - player_pos
	direction = direction.normalized()
	
	# Calculate the angle between the direction vector and the x-axis
	var angle_to_player = atan2(direction.y, direction.x)
	angle_to_player += rotation_speed * delta

	
	# Calculate new position based on angle, radius, and player position
	var x = player_pos.x + radius * cos(angle_to_player)
	var y = player_pos.y + radius * sin(angle_to_player)
	
	# Set the position of the sprite
	position = Vector2(x, y)

