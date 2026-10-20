extends Control
@onready var topics: VBoxContainer = $MarginContainer/List/MarginContainer/topics
@onready var v_box_container: VBoxContainer = $MarginContainer/List/MarginContainer/VBoxContainer
@onready var friends: VBoxContainer = $MarginContainer/List/MarginContainer/VBoxContainer/Invite/Friends

@onready var visibility: OptionButton = $MarginContainer/List/MarginContainer/VBoxContainer/GridContainer/Visibility
@onready var rounds_count: SpinBox = $MarginContainer/List/MarginContainer/VBoxContainer/GridContainer/RoundsCount
@onready var topic: Button = $MarginContainer/List/MarginContainer/VBoxContainer/Topic
@onready var start: Button = $MarginContainer/List/MarginContainer/VBoxContainer/Start
@onready var return_from_topics: Button = $MarginContainer/List/MarginContainer/topics/returnFromTopics
@onready var invite_scroll_container: ScrollContainer = $MarginContainer/List/MarginContainer/VBoxContainer/Invite



@export var friends_list:Array[User]
var friend_display_packed = preload("res://main_menu/social/add_user.tscn")
var friend_instances:Array[AddUser]
var added_user_by_id:String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in invite_scroll_container.get_children(true):
		
		if child is VScrollBar:
			print(child)
			var new_theme:StyleBoxEmpty = StyleBoxEmpty.new()
			new_theme.content_margin_left = 30
			child.add_theme_stylebox_override("scroll",new_theme.duplicate())
			new_theme.content_margin_left = 50
			child.add_theme_stylebox_override("scroll_focus",new_theme)
	for friend in friends_list:
		var new_friend_instance:AddUser = friend_display_packed.instantiate()
		friends.add_child(new_friend_instance)
		new_friend_instance.user_name.text = friend.name
		new_friend_instance.user_level.text = str(friend.level)
		new_friend_instance.user_id = friend.id
		friend_instances.append(new_friend_instance)
		new_friend_instance.userAdded.connect(add_user)
		new_friend_instance.userRemoved.connect(remove_user)

func add_user(user_id:String):
	if not added_user_by_id == "":
		for friend:AddUser in friend_instances:
			if friend.user_id == added_user_by_id:
				friend._on_add_pressed()
				break
	added_user_by_id = user_id
	
#func assumes only unique ids exist 
func remove_user():
	if not added_user_by_id == "":
		
		for friend:AddUser in friend_instances:
			if friend.user_id == added_user_by_id:
				added_user_by_id = ""
				friend._on_add_pressed()
				break
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

var friends_visible:bool = false
func _on_invite_pressed() -> void:
	print(friends_visible)
	if friends_visible:
		v_box_container.visible = true
		friends.visible = false
		friends_visible = false
	else:
		v_box_container.visible = false
		friends.visible = true
		friends_visible = true

var topics_visible:bool = false
func _on_topic_pressed() -> void:
	if topics_visible:
		v_box_container.visible = true
		topics.visible = false
		topics_visible = false
	else:
		v_box_container.visible = false
		topics.visible = true
		topics_visible = true


func _on_start_pressed() -> void:
	pass # Replace with function body.


func _on_return_from_topics_pressed() -> void:
	_on_topic_pressed()
	


func _on_return_from_friends_pressed() -> void:
	_on_invite_pressed()


func _on_close_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/new_game/new_game.tscn")
