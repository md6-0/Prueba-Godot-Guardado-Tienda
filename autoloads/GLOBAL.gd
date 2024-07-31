extends Node

var credits: int
var gems: int
var deck = []

func _ready():
	reset_vars()
	SAVEMANAGER.load_game()

func reset_vars():
	credits = 0
	gems = 0
	deck = []
