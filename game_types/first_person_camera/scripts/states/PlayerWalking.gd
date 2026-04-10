extends State

@onready var body = get_parent().body

func enter():
	pass

func update(delta):
	if Input.is_action_just_pressed("crouch") and body.is_on_floor():
			emit_signal("transition", "playercrouching", self)

func physics_update(delta):
	var forward_input = Input.get_axis("fps_forward", "fps_backward")
	var sideways_input = Input.get_axis("fps_strafe_left", "fps_strafe_right")
	var direction = (body.transform.basis.z * forward_input) + (body.transform.basis.x * sideways_input)
	
	if direction.length() > 0:
		if Input.is_action_pressed("sprint") and body.is_on_floor():
			emit_signal("transition", "playersprinting", self)
		else:
			body.move_direction.x = (direction.normalized() * get_parent().walk_speed).x
			body.move_direction.z = (direction.normalized() * get_parent().walk_speed).z
	else:
		emit_signal("transition", "playeridle", self)
		body.move_direction = Vector3.ZERO
		
func exit():
	pass
