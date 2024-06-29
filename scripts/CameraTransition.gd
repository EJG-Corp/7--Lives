extends Node2D

var transitioning: bool = false
var next_camera: Camera2D

func transition_camera2D(from_camera: Camera2D, to_camera: Camera2D, duration: float = 0.25) -> void:
	if transitioning:
		return
	
	transitioning = true
	next_camera = to_camera

	# Create a tween for smooth transition
	var tween: Tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	
	# Tween the essential properties
	tween.tween_property(from_camera, "offset", to_camera.offset, duration)
	tween.tween_property(from_camera, "zoom", to_camera.zoom, duration)
	tween.tween_property(from_camera, "global_position", to_camera.global_position, duration)
	tween.tween_property(from_camera, "drag_horizontal_offset", to_camera.drag_horizontal_offset, duration)
	tween.tween_property(from_camera, "drag_vertical_offset", to_camera.drag_vertical_offset, duration)
	# Connect the tween finished signal
	tween.connect("finished", _on_tween_finished)
	
	# Start the tween
	tween.play()

func _on_tween_finished():
	next_camera.make_current()
	print("finished")
	print("Transition finished. Current camera position: ", next_camera.global_position)
	transitioning = false
