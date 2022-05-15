extends Node

onready var inventory = preload("res://UI/Inventory/Inventory.tres")
onready var world = preload("res://World.tscn")

var picked_up_item = null

var item_index = 0

func _process(_delta):
	print(picked_up_item)
	if picked_up_item != null:
		if inventory.items[item_index] == null:
			inventory.set_item(item_index, picked_up_item)
			item_index = 0
		else:
			item_index += 1
		
