extends Control
enum MODE{
	LOGIN,
	REGISTER
}
@export var mode:MODE
@onready var label: Label = $MarginContainer/Panel/MarginContainer/VBoxContainer/Label
@onready var email: TextEdit = $MarginContainer/Panel/MarginContainer/VBoxContainer/Email
@onready var email_or_username: TextEdit = $MarginContainer/Panel/MarginContainer/VBoxContainer/EmailOrUsername
@onready var username: TextEdit = $MarginContainer/Panel/MarginContainer/VBoxContainer/Username
@onready var password: TextEdit = $MarginContainer/Panel/MarginContainer/VBoxContainer/Password
@onready var confirm_password: TextEdit = $MarginContainer/Panel/MarginContainer/VBoxContainer/ConfirmPassword
@onready var confirm_login: Button = $MarginContainer/Panel/MarginContainer/VBoxContainer/ConfirmLogin
@onready var change_to_register: Button = $MarginContainer/Panel/MarginContainer/VBoxContainer/ChangeToRegister


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_change_to_register_pressed()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func change_ui_to_register():
	mode = MODE.REGISTER
	email.visible = true
	username.visible = true
	confirm_password.visible = true
	
	email_or_username.visible = false
	
	label.text = "Register"
	confirm_login.text = "Register"
	change_to_register.text = "Or Login"

func change_ui_to_login():
	mode = MODE.LOGIN
	email.visible = false
	username.visible = false
	confirm_password.visible = false
	
	email_or_username.visible = true
	label.text = "Login"
	confirm_login.text = "Login"
	change_to_register.text = "Or Register"
func _on_change_to_register_pressed() -> void:
	if mode == MODE.LOGIN:
		change_ui_to_register()
	else:
		change_ui_to_login()


func _on_confirm_login_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/main_menu.tscn")
