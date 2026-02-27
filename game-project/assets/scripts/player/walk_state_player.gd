class_name player_walk
extends state



func enter_state():
	print("entering walking")
func _ready() -> void:
	pass

func physics_update(delta: float):
	var character = statemachine.get_parent()
	var dir = 0
	#if Input.is_action_pressed("down"):
		#character.velocity.x = character.speed 
		#dir = 1
	#if dir == 0:
		#character.velocity.x = 0
		#character.velocity.y = 0
	
	if character.direction:
		character.velocity.x = character.direction.x * character.speed
		character.velocity.z = character.direction.z * character.speed
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, character.speed)
		character.velocity.z = move_toward(character.velocity.z, 0, character.speed)
		statemachine.change_state("idle_player")
	if Input.is_action_just_pressed("jump"):
		statemachine.change_state("jump_player")
	character.move_and_slide()
	
