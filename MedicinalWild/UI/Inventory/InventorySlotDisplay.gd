extends CenterContainer


var tooltip = preload("res://UI/ToolTip/ToolTip.tscn")
var inventory = preload("res://UI/Inventory/Inventory.tres")
var mouseInScreen = null
var isItem = false
var thisItem = ""
var thisItemName = ""
var tooltipExists = false
var tooltipPos = Vector2.ZERO

onready var itemTextureRect = $ItemTextureRect
onready var itemAmountLabel = $ItemTextureRect/ItemAmountLabel



func _process(_delta):
	check_tooltip()
	tooltip_follow_mouse()
	if tooltipExists:
		get_node("ToolTip").rect_global_position = tooltipPos


func display_item(item):

	if item is Item:
		itemTextureRect.texture = item.texture
		if item.amount > 1:
			itemAmountLabel.text = str(item.amount)
	else:
		itemTextureRect.texture = load("res://UI/Inventory/EmptyInventorySlot.png")
		itemAmountLabel.text = ""
	


func get_drag_data(_position):


	var item_index = get_index()
	var item = inventory.remove_item(item_index)
	if item is Item:
		var data = {}
		data.item = item
		data.item_index = item_index
		var dragPreview = TextureRect.new()
		dragPreview.texture = item.texture
		var c = Control.new()
		dragPreview.rect_position = -0.5 * item.texture.get_size()
		c.add_child(dragPreview)
		set_drag_preview(c)
		inventory.drag_data = data
		return data
		
		
	
func can_drop_data(_position, data):
	return data is Dictionary and data.has("item")

func drop_data(_position, data):
	var my_item_index = get_index()
	var my_item = inventory.items[my_item_index]
	if my_item is Item and my_item.name == data.item.name:
		if my_item.amount + data.item.amount <= 99:
			my_item.amount += data.item.amount
			inventory.emit_signal("items_changed", [my_item_index])
		else:
			if inventory.drag_data is Dictionary:
				inventory.set_item(inventory.drag_data.item_index, inventory.drag_data.item)
	else:
		
		inventory.swap_items(my_item_index, data.item_index)
		inventory.set_item(my_item_index, data.item)

		
		
	inventory.drag_data = null

func check_tooltip():
	var item_index = get_index()
	if inventory.items[item_index] != null:
		isItem = true
		thisItem = inventory.items[item_index]
		thisItemName = thisItem.name

func _on_ItemTextureRect_mouse_entered():
	var item_index = get_index()
	var tooltip_instance = tooltip.instance()
	tooltipExists = true
	tooltip_instance.rect_global_position = tooltipPos
	add_child(tooltip_instance)
	
	if inventory.items[item_index] != null:
		
		var title = tooltip_instance.get_node("Background/MarginContainer/VBoxContainer/Label")
		var description = tooltip_instance.get_node("Background/MarginContainer/VBoxContainer/Label2")
		title.text = str(thisItemName)
		description.text = str(thisItem.description)
		yield(get_tree().create_timer(.05), "timeout")
		if has_node("ToolTip"):
			tooltip_instance.show()
			

func _on_ItemTextureRect_mouse_exited():
	yield(get_tree().create_timer(.05), "timeout")
	tooltipExists = false
	if has_node("ToolTip"):
		get_node("ToolTip").free()
	
		
func tooltip_follow_mouse():
	
		tooltipPos = get_global_mouse_position()
		
		
