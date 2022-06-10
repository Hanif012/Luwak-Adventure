extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer

export var score: = 1

func _on_Node2D_body_entered(body):
	picked()


func picked() -> void:
	Global.score += score
	anim_player.play("Picked")




