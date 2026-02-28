extends state

class_name dead_player

func enter_state():
	print("entering death")
	var character = statemachine.get_parent()
	character.velocity.x =0
	character.velocity.z =0
	character.animation_player.play('dead')
