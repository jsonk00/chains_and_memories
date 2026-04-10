extends StateMachine

@export var num_jumps: float = 1
@onready var current_jumps: int = 0
@export var jump_height: float = 50.0
@export var body: CharacterBody3D

func can_jump():
	if current_jumps < num_jumps:
		return true
	return false
