class_name OpenedMessage
extends Control

@export var message_data:Message_data

@onready var title_text: Label = $Panel/MarginContainer/HBoxContainer/TitleText
@onready var body_text: Label = $Panel2/MarginContainer/BodyText

signal messageClosed
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_close_pressed() -> void:
	messageClosed.emit()
