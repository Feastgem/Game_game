extends CharacterBody3D
@onready var camera_pivot: Node3D = $"camera pivot"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var camera_sensitvity: float = 0.005
@export var speed :float = 20
@export var jump: float = 10 
@onready var bullet_spawn: Node3D = $"camera pivot/Node3D"
var proj = load("res://assets/scenes/bullet.tscn")
var flight: bool = false
var direction : Vector3
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
func _physics_process(delta: float) -> void:
	if not is_on_floor() and ! flight:
		velocity.y -= 9.8 * delta
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	var input_dir : = Input.get_vector("left", "right", "up", "down")
	var direction_u := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	direction = direction_u
	move_and_slide()
	if Input.is_action_just_pressed("click"):
		var instance=proj.instantiate()
		instance.position=bullet_spawn.global_position
		instance.transform.basis=bullet_spawn.global_transform.basis
		get_parent().add_child(instance)

	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x * camera_sensitvity
		camera_pivot.rotation.x -= event.relative.y * camera_sensitvity
		camera_pivot.rotation.x = clamp(camera_pivot.rotation.x, -PI/2, PI/4)
