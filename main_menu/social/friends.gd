extends Control
@onready var no_friends: Control = $MarginContainer/List/MarginContainer/Control/NoFriends
@onready var friends_list: VBoxContainer = $MarginContainer/List/MarginContainer/Control/VScrollBar/FriendsList

@export var friends:Array[User]

var friend_display_packed = preload("res://user_profile/user_display.tscn")
var friend_instances:Array[UserDisplay]
# Delete the preload variable

func _ready():
	for friend in friends:
		var new_friend_instance:UserDisplay = friend_display_packed.instantiate()
		friends_list.add_child(new_friend_instance)
		new_friend_instance.user_name.text = friend.name
		new_friend_instance.user_level.text = str(friend.level)
		
func _process(_delta: float) -> void:
	pass

func _on_add_friends_pressed() -> void:
	var packed_scene: PackedScene = load("res://main_menu/social/search_for_user.tscn")
	var new_instance: Control = packed_scene.instantiate() as Control
	var parent: Node = get_parent()
	var current_index: int = get_index()
	parent.add_child(new_instance)
	parent.move_child(new_instance, current_index)
	queue_free()
