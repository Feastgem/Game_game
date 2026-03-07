extends Node
class_name  WeaponManager

signal weapon_changed(weapon: String)

var current_weapon: String : set = set_weapon
var prev_weapon: String : get = get_last_weapon

var weapons = {
	
	'none' : 1,
	'fireball' : 2,
	'flame' : 3
	
	}

func _ready() -> void:
	change_weapon(1)


func change_weapon(weapon_key: int):
	var weapon = weapons.find_key(weapon_key)
	if weapon in weapons:
		set_weapon(weapon)
		weapon_changed.emit(weapon)

func set_weapon(weapon: String):
	current_weapon = weapon

func get_last_weapon():
	return prev_weapon
