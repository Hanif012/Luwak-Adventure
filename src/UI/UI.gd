extends Control

onready var pause_overlay := $ColorRect

var is_paused = false setget set_is_paused

func _ready():
	$ColorRect/vbox/Resume.grab_focus()
	

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		self.is_paused = !is_paused
		$ColorRect/vbox/Resume.grab_focus()

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	pause_overlay.visible = value


func _on_Resume_pressed():
	self.is_paused = false

func _on_Quit_pressed():
	get_tree().quit()


func _on_Settings_pressed():
	$Popup.popup_centered()


func _on_Main_Menu_pressed():
	self.is_paused = false
	get_tree().change_scene("res://src/Menu/Main Menu.tscn")
