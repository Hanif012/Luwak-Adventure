extends Node

var door_name = null


#level Menu
var levels = []
var unlockedLevels = 1

#beans

signal updated
signal died
signal reset
signal upgrade
signal seduh

var score: = 0 setget set_score
var deaths: = 0 setget set_deaths
var money: = 0 setget set_money
var coffee: = 0 setget set_coffee
var days: = 1 setget set_days

func reset():
	self.score = 0
	self.deaths = 0
	emit_signal("reset")


func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("updated")

func set_money(new_money: int) -> void:
	money = new_money
	emit_signal("upgrade")
	
func set_coffee(new_coffee: int) -> void:
	coffee = new_coffee
	emit_signal("seduh")

func set_days(new_days: int) -> void:
	days = new_days
	emit_signal("dayy")
	
func set_deaths(new_value: int) -> void:
	deaths = new_value
	emit_signal("died")
