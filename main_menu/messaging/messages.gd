class_name Messages
extends Control
@onready var v_box_container: MarginContainer = $VBoxContainer
@onready var messages_list: VBoxContainer = $VBoxContainer/Panel/MarginContainer/MessagesList
@onready var no_messages: Label = $VBoxContainer/Panel/MarginContainer/MessagesList/NoMessages

@export var messages:Array[Message_data]

var message_preload:PackedScene = preload("res://main_menu/messaging/message.tscn")
var message_display_preload:PackedScene = preload("res://main_menu/messaging/opened_message.tscn")
var message_instances:Array[Message]
var message_display_instance:OpenedMessage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	message_display_instance = message_display_preload.instantiate()
	message_display_instance.visible = false
	message_display_instance.messageClosed.connect(returnFromMessage)
	v_box_container.add_child(message_display_instance)
	for i in messages.size():
		var new_message_instance:Message = message_preload.instantiate()
		new_message_instance.title_text = messages[i].message_title
		new_message_instance.id = i
		new_message_instance.openMessage.connect(onMessageOpened.bind(new_message_instance.id))
		messages_list.add_child(new_message_instance)
	if messages.size() == 0:
		no_messages.visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func displayMessage(title:String,body:String):
	message_display_instance.visible = true
	messages_list.visible = false
	message_display_instance.title_text.text = title
	message_display_instance.body_text.text = body

func returnFromMessage():
	message_display_instance.visible = false
	messages_list.visible = true

func onMessageOpened(id:int):
	displayMessage(messages[id].message_title,messages[id].message_body)
