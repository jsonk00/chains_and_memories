extends State

func enter():
	get_parent().current_jumps = 0

func update(delta):	if Input.is_action_just_pressed("jump"):
		emit_signal("transition", "playerjumping", self)


func physics_update(delta):
	pass

func exit():
	pass
