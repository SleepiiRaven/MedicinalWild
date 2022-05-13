extends GridContainer

var hotbar = preload("res://UI/HotBar/Hotbar.tres")

func _ready():
	hotbar.connect("items_changed", self, "_on_items_changed")
	hotbar.make_items_unique()
	update_inventory_display()

func update_inventory_display():
	for item_index in hotbar.items.size():
		update_inventory_slot_display(item_index)

func update_inventory_slot_display(item_index):
	var inventorySlotDisplay = get_child(item_index)
	var item = hotbar.items[item_index]
	inventorySlotDisplay.display_item(item)


func _on_items_changed(indexes):
	for item_index in indexes:
		update_inventory_slot_display(item_index)
		

func _unhandled_input(event):
	if event.is_action_released("ui_left_mouse"):
		if hotbar.drag_data is Dictionary:
			hotbar.set_item(hotbar.drag_data.item_index, hotbar.drag_data.item)
