extends State

@onready var body = get_parent().body
@export var collision_shape: CollisionShape3D
@export var feet_shape: CollisionShape3D
@export var main_cam: Camera3D
@export var raycast_check: RayCast3D
func enter():

	create_tween().tween_property(main_cam, "position", Vector3(0, 1.0, 0), 0.2)
	feet_shape.shape.height = 0.06
	collision_shape.shape.set_height(1.0)

func update(delta):
		if Input.is_action_just_pressed("crouch") and not raycast_check.is_colliding():
			emit_signal("transition", "playeridle", self)

func physics_update(delta):
	if body.is_on_floor() == false:
		emit_signal("transition", "playeridle", self)
	var forward_input = Input.get_axis("fps_forward", "fps_backward")
	var sideways_input = Input.get_axis("fps_strafe_left", "fps_strafe_right")
	var direction = (body.transform.basis.z * forward_input) + (body.transform.basis.x * sideways_input)
	
	if direction.length() > 0:

		if Input.is_action_just_pressed("sprint") and not raycast_check.is_colliding():
			emit_signal("transition", "playersprinting", self)
		else:
			body.move_direction.x = (direction.normalized() * get_parent().crouch_speed).x
			body.move_direction.z = (direction.normalized() * get_parent().crouch_speed).z
	else:
		body.move_direction = Vector3.ZERO
		
func exit():
	feet_shape.shape.height = 0.12
	create_tween().tween_property(main_cam, "position", Vector3(0, 1.6, 0), 0.2)
	collision_shape.shape.set_height(2.0)
