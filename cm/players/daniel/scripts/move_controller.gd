extends Node

var target_velocity: Vector3
var move_speed: float = 1.5
var back_speed: float = 1.0
var turn_speed: float = 2.0
@export var mira: CharacterBody3D
@export var enabled: bool = true
@onready var action_controller: Node = $"../ActionController"

func _ready() -> void:
	action_controller.action_started.connect(disable)
	action_controller.action_completed.connect(enable)

func _physics_process(delta: float) -> void:
	if not enabled:
		return
	var forward_axis = Input.get_axis("fps_forward", "fps_backward")
	if forward_axis < 0: # moving forward
		target_velocity = -get_parent().transform.basis.z * move_speed * forward_axis
	elif forward_axis > 0: # moving backward
		target_velocity = -get_parent().transform.basis.z * back_speed * forward_axis
	else:
		target_velocity = Vector3.ZERO
	var target_position: Vector3 = get_parent().global_position + target_velocity * delta
	
	var turn_axis = Input.get_axis("fps_strafe_right", "fps_strafe_left")
	get_parent().rotate_y(deg_to_rad(turn_axis) * turn_speed)
	
	if target_position.distance_to(mira.global_position) <= 6.7:
		get_parent().velocity = target_velocity
	else:
		get_parent().velocity = Vector3.ZERO
	get_parent().move_and_slide()

func disable(name):
	enabled = false

func enable(name):
	enabled = true
