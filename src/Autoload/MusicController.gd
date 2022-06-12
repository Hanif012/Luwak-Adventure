extends Node

var menu_music = load("res://Audio/Ludum Dare 30 - Track 4.wav")
var gameplay_music = load("res://Audio/Ludum Dare 38 - Track 1.wav")

func _ready():
	pass


func play_menu_music():
	$Music.stream = menu_music
	$Music.play()
	
func play_gameplay_music():
	$Music.stream = gameplay_music
	$Music.play()
	
#func play_battle_music():
#	$Music.stream = battle_music
#	$Music.play()
#
#func play_basic_music():
#	$Music.stream = basic_music
#	$Music.play()
#
#func turn_down_volume():
#	$Music.volume_db = -12
#
#func reset_volume():
#	$Music.volume_db = 0
