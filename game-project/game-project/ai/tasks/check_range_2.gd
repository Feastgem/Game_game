extends BTAction

func _tick(delta: float) -> Status:
	var player_pos = agent.player.global_position
	var agent_pos = agent.global_position
	blackboard.set_var("player_pos", player_pos)
	blackboard.set_var("agent_pos",agent_pos)
	var dist = player_pos.distance_to(agent_pos)
	if dist <=40:
		return FAILURE
	return SUCCESS
