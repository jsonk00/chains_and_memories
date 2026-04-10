extends Area3D
@onready var action_controller: Node = $"../ActionController"

func _ready() -> void:
	action_controller.action_started.connect(on_action)
	
func on_action(name):
	if name == "sword_swing_1":
		monitoring = true
		if has_overlapping_bodies():
			for body in get_overlapping_bodies():
				body.emit_signal("attacked")
