class_name Health
extends Node

signal health_changed
signal health_is_null
signal max_health_is

@export var side: String
@export var max_health: int = 100
var health: int = max_health : set = set_health , get = get_health

func _ready() -> void:
	max_health_is.emit(max_health)
	connect('hit_taken' , _on_hurtbox_hit_taken)
	set_health(max_health)

func set_health(value: int):
	if value<= max_health:
		health = value
		health = clampi(value, 0 , max_health)
		health_changed.emit(health)
	if health <=0:
		health_is_null.emit()


func get_health():
	return health


func _on_hurtbox_hit_taken(value: int, variation : String) -> void:
	if side != variation:
		var _damage: int = health - value
		set_health(_damage)
	
