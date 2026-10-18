extends Control
@onready var register: Button = $VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/MarginContainer/Register

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass




func _on_download_pressed() -> void:
	OS.shell_open("https://www.youtube.com/watch?v=QDia3e12czc")


func _on_register_pressed() -> void:
	get_tree().change_scene_to_file("res://authentication/log_in_or_register.tscn")
