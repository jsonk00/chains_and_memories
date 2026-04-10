class_name StateMachine extends Node

@export var current_state: State
var last_state: State
var states = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transition.connect(change_state)

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func change_state(new_state_name, old_state):
	last_state = old_state
	old_state.exit()
	current_state = states[new_state_name]
	current_state.enter()
