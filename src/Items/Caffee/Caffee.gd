extends Area2D

var active = false
export var coffee: = 1
export var score: = -1

#
#func _process(delta):
#	$Label.visible = active

func _input(event):
	if event.is_action_pressed("ui_accept") and active and Global.score > 0:
		make()
	elif event.is_action_pressed("ui_accept") and active and Global.score == 0:
		no_money()


func _on_Caffee_body_entered(body):
	if body.name == 'Player':
		active = true


func _on_Caffee_body_exited(body):
	if body.name == 'Player':
		active = false

func make() -> void:
	Global.coffee += coffee
	Global.score += score
	$AnimationPlayer.play("make")

func no_money() -> void:
	$AnimationPlayer.play("no")
