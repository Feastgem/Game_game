extends state
class_name fly_player
var time:bool
var dir : bool 
@export var flight_speed : int = 50
func enter_state():
	print('fly')
	var character = statemachine.get_parent()
	character.velocity.y += 50
	
	character.flight = true
	time = true
	
func physics_update(delta: float):
	var character = statemachine.get_parent()
	if Input.is_action_pressed("jump"):
		character.velocity.y = flight_speed * 0.4
		dir = true
	
	else:character.velocity.y = move_toward(character.velocity.y, 0, 5)
	if character.direction:
		character.velocity.x = character.direction.x * flight_speed
		character.velocity.z = character.direction.z * flight_speed
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, 3)
		character.velocity.z = move_toward(character.velocity.z, 0, 3)
	if Input.is_action_pressed("fly_down"):
		character.velocity.y = -flight_speed * 0.4
		dir = true
	if Input.is_action_just_pressed("fly") and not time:
		character.flight = false
		if not character.is_on_floor:
			if character.direction:
				statemachine.change_state('player_walk')
			else:
				statemachine.change_state('idle_player')
		else: statemachine.change_state('fall_player')
	time = false
