class_name QuestionNumericDisplay
extends QuestionDisplayType
@export var question:QuestionNumeric
@onready var timer: Timer = $Timer
@onready var line_edit: LineEdit = $VBoxContainer/LineEdit
@onready var button: Button = $VBoxContainer/Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	line_edit.placeholder_text =question.prefix
	timer.timeout.connect(func():
			line_edit.placeholder_text = question.prefix
			)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_line_edit_text_changed(new_text: String) -> void:
	line_edit.deselect()
	if !new_text.is_valid_int():
		line_edit.text = ""
		line_edit.placeholder_text = "Enter numeric value"
		timer.start()


func _on_button_pressed() -> void:
	if !line_edit.text.is_valid_int():
		_on_line_edit_text_changed(line_edit.text)
		return
	if int(line_edit.text) == question.answer_value:
		_correct_answer()
	else:
		_wrong_answer()
