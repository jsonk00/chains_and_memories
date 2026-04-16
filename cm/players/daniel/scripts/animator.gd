extends Node
@onready var animation_player: AnimationPlayer = $"../human_male_base/AnimationPlayer"
@onready var p = get_parent()
@onready var move_controller: Node = $"../MoveController"
@onready var action_controller: Node = $"../ActionController"

func _ready() -> void:
	action_controller.action_started.connect(play_anim)

func _process(delta: float) -> void:
	if move_controller.enabled:
		if p.velocity != Vector3.ZERO:
			if Input.is_action_pressed("fps_forward"):
				animation_player.play("walk")
			elif Input.is_action_pressed("fps_backward"):
				animation_player.play("walk_backward")
		else:
			animation_player.play("idle")

func play_anim(anim_name):
	animation_player.play(anim_name)
