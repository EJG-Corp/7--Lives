extends Node2D



var transitioning: bool = false



func transition_camera2D(from_camera: Camera2D, to: Camera2D, duration: float = 1.0) -> void:
	if transitioning: return
	# Make our transition camera current
	from_camera.make_current()
	
	# Make our transition camera current()
	transitioning = true
	
	# Move to the second camera, while also adjusting the parameters to
	# match the second camera
	var tween: Tween = get_tree().create_tween()

	tween.set_parallel(true)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	
	tween.tween_property(from_camera, "global_transform", to.global_transform, duration).from(from_camera.global_transform)
	tween.tween_property(from_camera, "zoom", to.zoom, duration)
	tween.tween_property(from_camera, "offset", to.offset, duration)
	
	tween.play()
	await tween.finished

	# Make the second camera current
	to.make_current() 
	transitioning = false
	

