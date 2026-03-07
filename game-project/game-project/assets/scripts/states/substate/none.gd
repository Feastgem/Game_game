extends SubState
class_name none

func enter_state():
	print("enter none")
	time = true
var time = true

func physics_update(delta: float):
	var character = statemanager.get_parent()
	if Input.is_action_just_pressed("aim") and not time and character.alive:
		statemanager.change_state("aiming")
		print('aiming')
	time = false
