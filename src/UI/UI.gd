extends Control

onready var pause_overlay := $ColorRect
onready var score_label: Label = $Score
onready var money_label: Label = $Money
onready var coffee_label: Label = $"Cup of Coffee"
var is_paused = false setget set_is_paused
var money: = 10 * Global.coffee

func _ready():
	$ColorRect/vbox/Resume.grab_focus()
	Global.connect("upgrade", self, "update_money")
	Global.connect("updated", self, "update_interface")
	Global.connect("died", self, "_on_Player_died")
	Global.connect("reset", self, "_on_Player_reset")
	Global.connect("seduh", self, "update_coffee")
	update_interface()
	update_money()
	update_coffee()
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		self.is_paused = !is_paused
		$ColorRect/vbox/Resume.grab_focus()

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	pause_overlay.visible = value

func update_interface() -> void:
	score_label.text = "Bean(s) Collected: %s" % Global.score

func update_money() -> void:
	money_label.text = "Money : %s" % money
	
func update_coffee() -> void:
	coffee_label.text = "Coffee : %s" % Global.coffee

func _on_Resume_pressed():
	self.is_paused = false

func _on_Quit_pressed():
	get_tree().quit()


func _on_Settings_pressed():
	$Popup.popup_centered()


func _on_Main_Menu_pressed():
	self.is_paused = false
	get_tree().change_scene("res://src/Menu/Main Menu.tscn")


#Audio
func _on_VolumeSlider_value_changed(value):
		AudioServer.set_bus_volume_db(
			AudioServer.get_bus_index("Master"),
			linear2db(value)
	)

