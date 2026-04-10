extends Node

var target_velocity: Vector3
var move_speed: float = 2.0
var turn_speed: float = 2.0
@export var mira: CharacterBody3D

func _physics_process(delta: float) -> void:
	var forward_axis = Input.get_axis("fps_forward", "fps_backward")
	target_velocity = -get_parent().transform.basis.z * move_speed * forward_axis
	var target_position: Vector3 = get_parent().global_position + target_velocity
	
	var turn_axis = Input.get_axis("fps_strafe_right", "fps_strafe_left")
	get_parent().rotate_y(deg_to_rad(turn_axis) * turn_speed)
	
	if target_position.distance_to(mira.global_position) <= 7.0:
		get_parent().velocity = target_velocity
	else:
		get_parent().velocity = Vector3.ZERO
	get_parent().move_and_slide()
