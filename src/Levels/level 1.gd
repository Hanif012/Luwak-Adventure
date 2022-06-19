extends Node2D

export(String, FILE, "*.tscn,*.scn") var target_scene

onready var Player := $PlayerNode/Player

# Called when the node enters the scene tree for the first time.
func _ready():
	print(Global.door_name)
	MusicController.play_gameplay_music()
	
	# code for finding the door:
	if Global.door_name:
		var door_node = find_node(Global.door_name)
		if door_node:
			Player.global_position = door_node.global_position
			


func _on_Button_pressed():
	var ERR = get_tree().change_scene(target_scene)
	
	if ERR != OK:
		print("something failed in the door scene")
	



