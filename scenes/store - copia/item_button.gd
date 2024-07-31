extends Control

var name_label
var texture_rect
var description_label
var credits_label

var item_id :int
var item_name :String
var item_icon :String
var item_description :String
var item_credits :int
var item_sold: bool
@onready var error_audio = $Error_Audio
@onready var success_audio = $Success_Audio

func _ready():
	name_label = %Name_Label
	texture_rect = %TextureRect
	description_label = %Description_Label
	credits_label = %Credits_Label
	
	name_label.text = item_name + " card"
	description_label.text = item_description
	credits_label.text = str(item_credits) + " credits"
	if item_sold:
		set_items_as_sold()
	else: texture_rect.texture = load(item_icon)

func set_items_as_sold():
	item_sold = true
	texture_rect.texture = load("res://icons/sold.png")
	texture_rect.rotation = .15
	texture_rect.pivot_offset.y = 100
	texture_rect.pivot_offset.x = 100

# Función para manejar la compra de ítems
func _on_buy_button_pressed():
	if GLOBAL.credits >= item_credits and not item_sold:
		set_items_as_sold()
		GLOBAL.credits -= item_credits
		GLOBAL.deck.append(item_name)
		success_audio.play()
		SAVEMANAGER.save_game()
	else:
		error_audio.play()

