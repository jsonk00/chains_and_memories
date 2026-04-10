class_name FPSCameraController extends CharacterComponent
@export var camera: Camera3D
@export var disable_vertical_look: bool = false
@export var max_angle_degrees: float = 90
@export var min_angle_degrees: float = 45

func _ready() -> void:
	if enabled:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and enabled:
		if not disable_vertical_look:
			camera.rotate_x(deg_to_rad(-event.relative.y * ApplicationManager.options.v_sensitivity))
			camera.rotation_degrees.x = clampf(camera.rotation_degrees.x, min_angle_degrees, max_angle_degrees)
		body.rotate_y(deg_to_rad(-event.relative.x * ApplicationManager.options.h_sensitivity))
		
