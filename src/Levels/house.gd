extends Area2D

var active = false

func _ready():
	connect("body_entered", self, '_on_Shop_body_entered')
	connect("body_exited", self, '_on_Shop_body_exited')

#func _process(delta):
#	$Label.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start('/Rumah orang')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)

func _on_Shop_body_entered(body):
	if body.name == 'Player':
		active = true


func _on_Shop_body_exited(body):
	if body.name == 'Player':
		active = false

#The func unpause() function needs one additional line:
#active = false
func unpause(timeline_end):
	get_tree().paused = false
