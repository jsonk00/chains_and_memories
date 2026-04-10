extends State

@onready var body: CharacterBody3D = get_parent().body

func enter():
	body.velocity.y = get_parent().jump_height
	get_parent().current_jumps += 1

func update(delta):
	if Input.is_action_just_pressed("jump") and get_parent().can_jump():
		body.velocity.y = get_parent().jump_height
		get_parent().current_jumps += 1

func physics_update(delta):
	if body.is_on_floor():
		emit_signal("transition", "playergrounded", self)
	elif body.velocity.y < 0:
		emit_signal("transition", "playerfalling", self)

func exit():
	pass
