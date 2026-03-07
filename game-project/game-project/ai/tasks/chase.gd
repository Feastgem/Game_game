extends BTAction


func _tick(delta: float) -> Status:
	var player_pos= blackboard.get_var("player_pos")
	var agent_pos = blackboard.get_var("agent_pos")
	blackboard.set_var("agent_pos", agent.global_position)
	blackboard.set_var("player_pos", agent.player.global_position)
	var dist = player_pos.distance_to(agent_pos)
	if dist <= 15:
		agent.in_range = false
		agent._move(player_pos)
		return SUCCESS
	elif dist >= 40:
		agent.in_range = false
		agent._move(player_pos)
		return FAILURE
	elif dist <= 40 and dist >= 15:
		agent._move(player_pos)
		agent.in_range = true
	return RUNNING
