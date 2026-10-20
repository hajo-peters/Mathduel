class_name QuestionDisplay
extends Control
@export var questions:Array[Question]

var boolean_question_display:PackedScene = preload("res://round/question_boolean_display.tscn")
var multiple_choice_question_display:PackedScene = preload("res://round/question_boolean_display.tscn")
var numeric_question_display:PackedScene = preload("res://round/question_numeric_display.tscn")
var text_question_dislay:PackedScene = preload("res://round/question_text_display.tscn")

@onready var question_display_area: Control = $Panel/MarginContainer/Control/QuestionDisplayArea

var current_question_display:QuestionDisplayType

func _ready():
	load_question(0)

func load_question(index:int):
	current_question_display.queue_free()
	
	match questions[index]:
		QuestionBoolean:
			current_question_display = boolean_question_display.instantiate()
			
		QuestionMultipleChoice:
			current_question_display = multiple_choice_question_display.instantiate()
		QuestionNumeric:
			current_question_display = numeric_question_display.instantiate()
		QuestionText:
			current_question_display = text_question_dislay.instantiate()
	current_question_display.question = questions[index]
	question_display_area.add_child(current_question_display)
