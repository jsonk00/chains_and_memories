extends State

@onready var body = get_parent().body

func enter():
	pass

func update(delta):
	if Input.is_action_just_pressed("crouch") and body.is_on_floor():
		emit_signal("transition", "playercrouching", self)
	var i = Input.get_vector("fps_strafe_left", "fps_strafe_right", "fps_forward", "fps_backward")
	if i != Vector2.ZERO:
		if Input.is_action_pressed("sprint"):
			emit_signal("transition", "playersprinting", self)
		else:
			emit_signal("transition", "playerwalking", self)

func physics_update(delta):
	pass

func exit():
	pass
