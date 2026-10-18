class_name Message
extends Control
@onready var title: Label = $Panel/MarginContainer/HBoxContainer/Title
@onready var read: Button = $Panel/MarginContainer/HBoxContainer/Read

var title_text:String
var id:int
signal openMessage(id)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title.text = title_text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_read_pressed() -> void:
	openMessage.emit()
