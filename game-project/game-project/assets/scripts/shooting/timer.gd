extends Timer
class_name weapon_shoot_delay
@export var fire_delay: int = 1


func _ready() -> void:
	wait_time =fire_delay
