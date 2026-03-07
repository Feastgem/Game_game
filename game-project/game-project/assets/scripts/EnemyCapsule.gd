extends CharacterBody3D
class_name EnemyCapsule

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var shoot: MeshInstance3D = $shoot

@export var MoveSpeed = 20
var player : Player
var in_range : bool = true

func _ready() -> void:
	for child in get_parent().get_children():
		if child is Player:
			player = child

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= 9.8
	move_and_slide()

func _on_health_health_is_null() -> void:
	#animation_player.play("death")
	queue_free()
	pass

func _shoot():
	var Bullet = load("res://assets/scenes/bullet_enemy.tscn")
	var instance=Bullet.instantiate()
	var bullet_spawn = shoot
	instance.position=bullet_spawn.global_position
	instance.transform.basis=bullet_spawn.global_transform.basis
	get_parent().add_child(instance)

func _move(target):
	look_at(target)
	if in_range:
		velocity = global_position.direction_to(target) * MoveSpeed
	else :
		velocity = Vector3(0,0,0)
