extends Node2D

@onready var label = $Label
@onready var label2 = $Label2

func _process(_delta):
	label.text = "Credits: " + str(GLOBAL.credits)
	label2.text = "Gems: " + str(GLOBAL.gems)

func _on_add_credits_pressed():
	GLOBAL.credits += 10
	SAVEMANAGER.save_game()


func _on_add_gems_pressed():
	GLOBAL.gems += 10
	SAVEMANAGER.save_game()


func _on_button_pressed():
	SAVEMANAGER.delete_save()


func _on_store_button_pressed():
	get_tree().change_scene_to_file("res://scenes/store/store.tscn")
