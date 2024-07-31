extends Control

var items = []
@onready var item_list = $ScrollContainer/GridContainer
@onready var credits_label = $Credits_Label
@onready var gems_label = $Gems_Label

func _ready():
	items = preload("res://scenes/store/store_item.gd").ITEMS
	credits_label.text = "Credits: " + str(GLOBAL.credits)
	gems_label.text = "Gems: " + str(GLOBAL.gems)
	update_credits_label()
	populate_shop()


func _process(_delta):
	update_credits_label()

# Actualiza la etiqueta de créditos del jugador
func update_credits_label():
	credits_label.text = "Credits: " + str(GLOBAL.credits)
	gems_label.text = "Gems: " + str(GLOBAL.gems)

# Llena la tienda con los ítems
func populate_shop():
	for item_data in items:
		var item_container = preload("res://scenes/store/item_button.tscn").instantiate()
		item_container.item_name = item_data.name
		item_container.item_icon = item_data.icon
		item_container.item_description = item_data.description
		item_container.item_credits = item_data.price
		
		if GLOBAL.deck:
			for item in GLOBAL.deck:
				if item_data.name == item:
					item_container.item_sold = true
		else: item_container.item_sold = false
		item_container.custom_minimum_size = Vector2(260,400)
		item_list.add_child(item_container)


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")
