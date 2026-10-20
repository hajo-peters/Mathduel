class_name QuestionBooleanDisplay
extends QuestionDisplayType
@export var question:QuestionBoolean
@onready var button: Button = $VBoxContainer/Button
@onready var button_2: Button = $VBoxContainer/Button2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if question.is_true:
		button.pressed.connect(_correct_answer)
		button_2.pressed.connect(_wrong_answer)
	else:
		button.pressed.connect(_wrong_answer)
		button_2.pressed.connect(_correct_answer)
