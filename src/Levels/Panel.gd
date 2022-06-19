extends Panel

var active = false

func _process(delta):
	self.visible= active



func _on_Shop_buttonshow():
	active = true

func _on_Button2_pressed():
	active = false
