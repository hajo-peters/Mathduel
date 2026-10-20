class_name QuestionTextDisplay
extends QuestionDisplayType
@export var question:QuestionText
@onready var timer: Timer = $Timer
@onready var line_edit: LineEdit = $VBoxContainer/LineEdit
@onready var button: Button = $VBoxContainer/Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	line_edit.placeholder_text =question.prefix


func _on_button_pressed() -> void:
	if line_edit.text == question.answer_text:
		_correct_answer()
	else:
		_wrong_answer()
