extends Area2D




func _on_Area2D_body_entered(body):
	if body.name == 'player':
		Global.unlockedLevels += 1 # Unlock the next level after completing the present one
		get_tree().change_scene("res://Node2D"+ str(Global.unlockedLevels) +".tscn") # Change scene to the next level
	
