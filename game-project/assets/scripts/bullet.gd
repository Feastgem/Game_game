extends CharacterBody3D
class_name bullet

var speed=10
func _process(delta):
	position += transform.basis * Vector3(0,0,-speed) * delta

func _on_timer_timeout() -> void:
	queue_free()
