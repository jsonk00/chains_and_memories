extends Node
@onready var animation_player: AnimationPlayer = $"../human_male_base/AnimationPlayer"

@onready var p = get_parent()
func _process(delta: float) -> void:
	if p.velocity != Vector3.ZERO:
		if Input.is_action_pressed("fps_forward"):
			animation_player.play("walk")
