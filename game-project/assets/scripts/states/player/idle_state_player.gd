extends state

class_name idle_player
func enter_state():
	print('entering idle')
func handle_input(event: InputEvent):
	if Input.is_action_pressed("up") or Input.is_action_pressed("down") or Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		statemachine.change_state("player_walk")
	
	if Input.is_action_just_pressed("jump"):
		statemachine.change_state("jump_player")
	if Input.is_action_just_pressed("fly"):
		statemachine.change_state('fly_player')
