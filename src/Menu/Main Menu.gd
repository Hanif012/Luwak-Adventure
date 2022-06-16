extends Node

export(PackedScene) var target_scene

func _ready():
	$TabContainer/Menu/VBoxContainer/START.grab_focus()
	MusicController.play_gameplay_music()


func _on_START_pressed():
		if !target_scene: # is null
			print("no scene in this door")
			return	
		next_level()
	
			
func next_level():
	var ERR = get_tree().change_scene_to(target_scene)
	
	if ERR != OK:
		print("something failed in the door scene")


func _on_QUIT_pressed():
	get_tree().quit()
