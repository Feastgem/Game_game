extends BTAction

func _tick(delta: float) -> Status:
	var player_pos = agent.player.global_position
	var agent_pos = agent.global_position
	var dist = player_pos.distance_to(agent_pos)
	if dist <=30:
		return FAILURE
	return SUCCESS
