extends Control

@onready var waiting_for_oponent: Label = $"MarginContainer/Panel/MarginContainer/VBoxContainer/Waiting for Oponent"
@onready var texture_rect: TextureRect = $MarginContainer/Panel/MarginContainer/VBoxContainer/TextureRect
@onready var button: Button = $MarginContainer/Panel/MarginContainer/VBoxContainer/Button
@onready var margin_container: MarginContainer = $MarginContainer
@onready var panel: Panel = $Panel
@onready var label: Label = $Panel/VBoxContainer/Label
@onready var button2: Button = $Panel/VBoxContainer/Button
@onready var texture_rect2: TextureRect = $Panel/VBoxContainer/TextureRect

# Radians per second (PI = half rotation per second, TAU = full rotation per second)
@export var rotation_speed: float = TAU 

func _ready() -> void:
	match_started()
	# Wait for the UI containers to finish their layout math
	await get_tree().process_frame
	
	# Now the size is accurate, so the pivot will be exactly in the center
	texture_rect.pivot_offset = texture_rect.size / 2.0
func _process(delta: float) -> void:
	# Apply frame-rate independent continuous rotation
	texture_rect.rotation += rotation_speed * delta

signal start_round
var seconds_left:int = 3
func match_started():
	margin_container.visible = false
	panel.visible = true
	var countdown:Timer = Timer.new()
	countdown.wait_time = 1
	countdown.autostart = true
	countdown.timeout.connect(func():
		seconds_left-=1
		if seconds_left <= 0:
			start_round.emit()
			label.text = "Starting..."
			label.add_theme_font_size_override("font_size", 150)
			button2.visible = true
			texture_rect2.visible = true
			return
		label.text = str(seconds_left)
		)
	
	add_child(countdown)
	countdown.start()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/new_game/match/create_match.tscn")
	

func _on_something_did_happen() -> void:
	nothing_ever_happens()

func nothing_ever_happens():
	get_tree().change_scene_to_file("res://main_menu/new_game/match/create_match.tscn")
