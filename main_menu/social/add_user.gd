class_name AddUser
extends Control
@onready var user_name: Label = $Panel/MarginContainer/HBoxContainer/UserName
@onready var user_level: Label = $Panel/MarginContainer/HBoxContainer/UserLevel
@onready var add: Button = $Panel/MarginContainer/HBoxContainer/Add

signal userAdded(id:int)
signal userRemoved
@export var user_id:String
var added:bool = false

func _on_add_pressed() -> void:
	if added:
		add.text = "+"
		userRemoved.emit()
		added = false
	else:
		userAdded.emit(user_id)
		add.text = "✓"
		added = true
	
