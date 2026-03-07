class_name Player
extends CharacterBody3D
@onready var camera_pivot: Node3D = $"camera pivot"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var weapon_manager: WeaponManager = $WeaponManager
@export var camera_sensitvity: float = 0.005
@export var speed :float = 20
@export var jump: float = 10 
@onready var bullet_spawn: Node3D = $"camera pivot/Node3D"
@onready var Rate_Of_Fire: weapon_shoot_delay = $weapon_shoot_delay
@onready var flame_delay: weapon_shoot_delay = $flame_delay
@export var UI: CanvasLayer
@onready var camera: Camera3D = $"camera pivot/camera"
var shootable_fireball: bool = true
var shootable_flame: bool = true
var Aiming: bool = false
var proj = load("res://assets/scenes/bullet.tscn")
var flame = load("res://assets/scenes/flame.tscn")
var flight: bool = false
var direction : Vector3
var alive : bool = true
var weapon_key : int = 1
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
func _physics_process(delta: float) -> void:
	if not is_on_floor() and ! flight:
		velocity.y -= 12 * delta
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	var input_dir : = Input.get_vector("left", "right", "up", "down")
	var direction_u := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	direction = direction_u
	move_and_slide()
	# fireball
	if Input.is_action_just_pressed("click") and shootable_fireball and Aiming and UI.energy_bar.value >= 20 and weapon_key == 2:
		print("nig")
		var instance=proj.instantiate()
		instance.position=bullet_spawn.global_position
		instance.transform.basis=bullet_spawn.global_transform.basis
		get_parent().add_child(instance)
		shootable_fireball = false
		Rate_Of_Fire.start()
		UI.gun_time.value = 0
		UI.subenergy(20)
	#flame
	if Input.is_action_just_pressed("click") and shootable_flame and Aiming and UI.energy_bar.value >= 50 and weapon_key == 3:
		shootable_flame = false
		print("flame")
		var instance=flame.instantiate()
		instance.position=bullet_spawn.position
		instance.transform.basis=bullet_spawn.transform.basis
		bullet_spawn.add_child(instance)
		flame_delay.start()
		UI.subenergy(50)
	
	if Input.is_action_just_pressed("mousefree"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.is_action_just_pressed("capt"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if Input.is_action_just_pressed('next weapon'):
		weapon_key += 1
		weapon_key = clampi(weapon_key, 1, 3) 
		weapon_manager.change_weapon(weapon_key)
	if Input.is_action_just_pressed('prev weapon'):
		weapon_key -= 1
		weapon_key = clampi(weapon_key, 1, 3) 
		weapon_manager.change_weapon(weapon_key)

	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x * camera_sensitvity
		camera_pivot.rotation.x -= event.relative.y * camera_sensitvity
		camera_pivot.rotation.x = clamp(camera_pivot.rotation.x, -PI/2, PI/4)


func _on_weapon_shoot_delay_timeout() -> void:
	shootable_fireball = true
	UI.gun_time.value = lerpf(0.0, 10.0, 1.0)


func _on_flame_delay_timeout() -> void:
	shootable_flame = true
