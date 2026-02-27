class_name state_machine
extends Node

@export var init_state:state 
var current_state: state : set = set_state
var states: Dictionary ={}

func _ready() -> void:
	for child in get_children():
		if child is state:
			states[child.name.to_lower()] = child
			child.statemachine = self 
			print(child)
		if init_state:
			change_state(init_state.name.to_lower())


func set_state(State: state):
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


func _on_health_health_is_null() -> void:
	change_state("dead_player")
