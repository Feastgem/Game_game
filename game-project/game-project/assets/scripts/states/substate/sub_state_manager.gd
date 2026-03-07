extends Node
class_name SubStateManager

@export var init_state:SubState 
var current_state: SubState : set = set_state
var states: Dictionary ={}

func _ready() -> void:
	for child in get_children():
		if child is SubState:
			states[child.name.to_lower()] = child
			child.statemanager = self 
		if init_state:
			change_state(init_state.name.to_lower())


func set_state(State: SubState):
	current_state = State

func change_state(State_name: String):
	if current_state:
		current_state.exit_state()
		
	current_state = states.get(State_name.to_lower())
	if current_state:
		current_state.enter_state()

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func _input(event: InputEvent) -> void:
	if current_state:
		current_state.handle_input(event)
