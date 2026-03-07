class_name Hurtbox
extends Area3D

signal hit_taken
func _ready() -> void:
	connect("area_entered", _on_area_entered)
	collision_layer = 2
	collision_mask = 2

func _on_area_entered(hitbox: Hitbox):
	if hitbox != null:
		var _damage: int = hitbox.damage
		var side = hitbox.side
		hit_taken.emit(_damage, side)
		
