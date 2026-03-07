extends CanvasLayer

@export var healthbar : ProgressBar
@onready var gun_time: ProgressBar = $Panel2/gun_time
@onready var crosshair: TextureRect = $Panel3
@onready var energy_bar: ProgressBar = $Panel/energy_bar
@onready var weapon_name: Label = $Panel/weapons_label/Label
@onready var none_: TextureRect = $Panel/weapons_label/none
@onready var flame: TextureRect = $Panel/weapons_label/flame
@onready var fireball: TextureRect = $Panel/weapons_label/fireball



func _ready() -> void:
	crosshair.visible = false
	
func _on_health_health_changed(health_new: int) -> void:
	if health_new <= healthbar.max_value:
		healthbar.value = health_new
	
func subenergy(energy):
	energy_bar.value-= energy

func _on_health_max_health_is(health: int) -> void:
	healthbar.max_value = health

func _process(delta: float) -> void:
	energy_bar.value += delta/delta * 0.2

func _on_aiming_aiming() -> void:
	crosshair.visible = true

func _on_aiming_not_aiming() -> void:
	crosshair.visible = false

#func _change_weapon_symbol(weapon: String):
	#pass


func _on_weapon_manager_weapon_changed(weapon: String):
	weapon_name.set_text(weapon)
	none_.visible = false
	fireball.visible = false
	flame.visible = false
	match  weapon:
		"none":
			none_.visible = true
		'fireball':
			fireball.visible = true
		'flame':
			flame.visible = true
	
