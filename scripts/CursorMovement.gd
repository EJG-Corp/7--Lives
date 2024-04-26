extends Sprite2D


var pointer_position
func _process(delta):
	var mouse_pos: Vector2 = get_global_mouse_position() - global_position
	print(mouse_pos)
