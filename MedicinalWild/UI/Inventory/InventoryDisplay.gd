extends GridContainer


var inventory = preload("res://UI/Inventory/Inventory.tres")

func _ready():
	inventory.set_item(0, Settings.game_data.get("item0"))
	inventory.set_item(1, Settings.game_data.get("item1"))
	inventory.set_item(2, Settings.game_data.get("item2"))
	inventory.set_item(3, Settings.game_data.get("item3"))
	inventory.set_item(4, Settings.game_data.get("item4"))
	inventory.set_item(5, Settings.game_data.get("item5"))
	inventory.set_item(6, Settings.game_data.get("item6"))
	inventory.set_item(7, Settings.game_data.get("item7"))
	inventory.set_item(8, Settings.game_data.get("item8"))
	inventory.set_item(9, Settings.game_data.get("item9"))
	inventory.set_item(10, Settings.game_data.get("item10"))
	inventory.set_item(11, Settings.game_data.get("item11"))
	inventory.set_item(12, Settings.game_data.get("item12"))
	inventory.set_item(13, Settings.game_data.get("item13"))
	inventory.set_item(14, Settings.game_data.get("item14"))
	inventory.set_item(15, Settings.game_data.get("item15"))
	inventory.set_item(16, Settings.game_data.get("item16"))
	inventory.set_item(17, Settings.game_data.get("item17"))
	inventory.set_item(18, Settings.game_data.get("item18"))
	inventory.set_item(19, Settings.game_data.get("item19"))
	inventory.set_item(20, Settings.game_data.get("item20"))
	inventory.set_item(21, Settings.game_data.get("item21"))
	inventory.set_item(22, Settings.game_data.get("item22"))
	inventory.set_item(23, Settings.game_data.get("item23"))
	inventory.connect("items_changed", self, "_on_items_changed")
	inventory.make_items_unique()
	print(Settings.game_data.get("item0"))
	print(inventory.items[0])
	update_inventory_display()


func update_inventory_display():
	for item_index in inventory.items.size():
		update_inventory_slot_display(item_index)

func update_inventory_slot_display(item_index):
	var inventorySlotDisplay = get_child(item_index)
	var item = inventory.items[item_index]
	inventorySlotDisplay.display_item(item)


func _on_items_changed(indexes):
	for item_index in indexes:
		update_inventory_slot_display(item_index)
		

func _unhandled_input(event):
	if event.is_action_released("ui_left_mouse"):
		if inventory.drag_data is Dictionary:
			inventory.set_item(inventory.drag_data.item_index, inventory.drag_data.item)
