extends Tabs

func _on_VolumeSlider_value_changed(value):
	AudioServer.set_bus_volume_db(
			AudioServer.get_bus_index("Music"),
			linear2db(value)
	)
func _on_VolumeSlider2_value_changed(value):
	AudioServer.set_bus_volume_db(
			AudioServer.get_bus_index("SFX"),
			linear2db(value)
	)


func _on_Save_pressed():
	pass # Replace with function body.



