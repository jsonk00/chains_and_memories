extends CharacterBody3D

var move_direction = Vector3.ZERO
@export var state_machines: Node

func _physics_process(delta: float) -> void:
	velocity.x = move_direction.x
	velocity.z = move_direction.z
	
	velocity.y -= ProjectSettings.get_setting("physics/3d/default_gravity") * delta
	move_and_slide()
