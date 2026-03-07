extends CharacterBody3D



func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -=9.8
	move_and_slide()
