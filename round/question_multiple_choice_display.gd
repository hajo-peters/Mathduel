class_name QuestionMultipleChoiceDisplay
extends QuestionDisplayType

@onready var v_box_container: VBoxContainer = $VBoxContainer


@export var question:QuestionMultipleChoice
var button:PackedScene = preload("res://round/rounded_button.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(question.correct_index):
		var new_button:Button = button.instantiate()
		v_box_container.add_child(new_button)
		if i+1 == question.correct_index:
			new_button.pressed.connect(_correct_answer)
		else:
			new_button.pressed.connect(_wrong_answer)
		new_button.text = question.answers[i]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
