extends ColorRect

var inventory = preload("res://UI/Inventory/Inventory.tres")

func _ready():
	rect_position.x = 0
	rect_position.y = 0

func can_drop_data(_position, data):
	return data is Dictionary and data.has("item")
func drop_data(_position, data):
	inventory.set_item(data.item_index, data.item)
