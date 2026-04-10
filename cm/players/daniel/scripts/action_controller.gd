extends Node

var can_attack: bool = true
@export var animator: AnimationPlayer
var current_animation_name: String
signal action_started
signal action_completed

var action_dict = {
	"sword_swing_1": can_attack,
}

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("daniel_attack"):
		if can_attack:
			emit_signal("action_started", "sword_swing_1")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	action_dict[anim_name] = true
	emit_signal("action_completed", anim_name)
