extends state

class_name jump_player


func enter_state():
	print('entering jump')
	var character = statemachine.get_parent()
	if character.is_on_floor():
		print(character.jump)
		character.velocity.y = character.jump

#func _ready() -> void:
	#var character = statemachine.get_parent()
	#character.velocity.y = character.jump

func physics_update(delta: float):
	var character = statemachine.get_parent()
	if character.direction:
		character.velocity.x = character.direction.x * character.speed
		character.velocity.z = character.direction.z * character.speed
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, character.speed)
		character.velocity.z = move_toward(character.velocity.z, 0, character.speed)
	character.move_and_slide()
	if character.is_on_floor() and character.velocity.y >= 0:
		if character.direction:
			statemachine.change_state('player_walk')
		else:
			statemachine.change_state('idle_player')
	
	
