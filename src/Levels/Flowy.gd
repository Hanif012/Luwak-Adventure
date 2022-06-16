extends Area2D


func _ready():
	pass # Replace with function body.

func _on_Flowy_body_entered(body):
	if body.name == 'Player':
		$AnimationPlayer.play("Move")


func _on_Flowy_body_exited(body):
	if body.name == 'Player':
		$AnimationPlayer.play("Idle")
