extends Control

@onready var close: Button = $Panel/MarginContainer/HBoxContainer/Close
@onready var label_2: LineEdit = $Panel/MarginContainer/HBoxContainer/Label2
@onready var button: Button = $VBoxContainer/Panel/MarginContainer/Control/Button

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_close_pressed() -> void:
	# 1. Load and instantiate the specific scene
	var packed_scene: PackedScene = load("res://pages/friends.tscn")
	var new_instance: Control = packed_scene.instantiate() as Control
	var parent: Node = get_parent()
	var current_index: int = get_index()
	parent.add_child(new_instance)
	parent.move_child(new_instance, current_index)
	queue_free()
