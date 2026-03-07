extends SubState
class_name aiming
var time = true

signal Aiming
signal NotAiming

func enter_state():
	var character = statemanager.get_parent()
	character.animation_player.play('aiming')
	time = true
	character.Aiming =true
	Aiming.emit()

func exit_state():
	var character = statemanager.get_parent()
	character.animation_player.play_backwards('aiming')
	character.Aiming = false
	NotAiming.emit()

func update(delta: float):
	var character = statemanager.get_parent()
	if Input.is_action_just_pressed("aim") and not time and character.alive:
		statemanager.change_state("none")
	time = false
