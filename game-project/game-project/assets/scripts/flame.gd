extends Node3D
@onready var hitbox: CollisionShape3D = $Node3D/Hitbox/CollisionShape3D
@onready var gpu_particles_3d: GPUParticles3D = $Node3D/GPUParticles3D




func _on_timer_timeout() -> void:
	queue_free()


func _on_timer_2_timeout() -> void:
	hitbox.disabled = false


func _on_timer_3_timeout() -> void:
	hitbox.disabled = true
	gpu_particles_3d.amount = 0
