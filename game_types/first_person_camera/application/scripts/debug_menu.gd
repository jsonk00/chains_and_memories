extends Control

@onready var player = get_tree().get_first_node_in_group("player")
@onready var planar_state_label: Label = $VBoxContainer/PlanarStateLabel
@onready var airborne_state_label: Label = $VBoxContainer/AirborneStateLabel

func _ready() -> void:
	for sm in player.state_machines.get_children():
		if "planar" in sm.name.to_lower():
			for child in sm.get_children():
				child.transition.connect(update_planar_state_label)
		if "airborne" in sm.name.to_lower():
			for child in sm.get_children():
				child.transition.connect(update_airborne_state_label)
				
func update_planar_state_label(state_name, _state):
	planar_state_label.text = "Horizontal Movement State: " + str(state_name)

func update_airborne_state_label(state_name, _state):
	airborne_state_label.text = "Airborne State: " + str(state_name)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_debug"):
		visible = !visible
