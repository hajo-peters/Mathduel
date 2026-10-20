class_name QuestionDisplayType
extends Control

signal correct(is_correct:bool)
func _wrong_answer():
	correct.emit(false)
	print("false")
func _correct_answer():
	correct.emit(true)
	print("true")
