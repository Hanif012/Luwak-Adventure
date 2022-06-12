extends Area2D


func _ready():
	pass # Replace with function body.


func _on_Grass_body_entered(body):
	$AnimationPlayer.play("Move")
	
