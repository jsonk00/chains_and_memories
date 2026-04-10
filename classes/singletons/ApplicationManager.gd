extends Node

@onready var options = load_options()

func _ready() -> void:
	pass

func load_options():
	if ResourceLoader.exists("user://settings.tres"):
		return ResourceLoader.load("user://settings.tres")
	else:
		return GameOptions.new()
