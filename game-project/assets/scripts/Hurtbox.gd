class_name Hurtbox
extends Area3D

signal hit_taken
func _ready() -> void:
	connect("area_entered", _on_area_entered)

func _on_area_entered(hitbox: Hitbox):
	if hitbox != null:
		var _damage: int = hitbox.damage
		var side = hitbox.side
		hit_taken.emit(_damage, side)
