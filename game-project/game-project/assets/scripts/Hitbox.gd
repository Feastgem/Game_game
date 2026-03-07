class_name Hitbox
extends Area3D

@export var damage: int = 10
@export var side: String

func _ready() -> void:
	collision_layer = 2
	collision_mask = 2
