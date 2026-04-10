extends State

@onready var body: CharacterBody3D = get_parent().body


func enter():
	pass

func update(delta):	
	if Input.is_action_just_pressed("jump") and get_parent().can_jump():
		emit_signal("transition", "playerjumping", self)


func physics_update(delta):
	if body.is_on_floor():
		emit_signal("transition", "playergrounded", self)

func exit():
	pass
