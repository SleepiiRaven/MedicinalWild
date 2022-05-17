extends GridContainer

var ApplePie = preload("res://Items/Apple Pie.tres")
var Apple = preload("res://Items/Apple.tres")
var Carrot = preload("res://Items/Carrot.tres")
var Chamomile = preload("res://Items/Chamomile.tres")
var EssentialOil = preload("res://Items/EssentialOil.tres")
var GreenTea = preload("res://Items/GreenTea.tres")
var IronSword = preload("res://Items/IronSword.tres")
var MustardPlant = preload("res://Items/MustardPlant.tres")
var OakBranch = preload("res://Items/OakBranch.tres")
var PoisonMushroom = preload("res://Items/PoisonMushroom.tres")
var ShiitakeMushroom = preload("res://Items/ShiitakeMushroom.tres")
var StoneDagger = preload("res://Items/StoneDagger.tres")
var WoodenSword = preload("res://Items/WoodenSword.tres")

var inventory = preload("res://UI/Inventory/Inventory.tres")

func _ready():
	if Settings.game_data.get("item0") != null:
		var item = Settings.game_data.get("item0")
		load_inventory(item, 0)
	else:
		inventory.items[0] = null
	if Settings.game_data.get("item1") != null:
		var item = Settings.game_data.get("item1")
		load_inventory(item, 1)
	else:
		inventory.items[1] = null
	if Settings.game_data.get("item2") != null:
		var item = Settings.game_data.get("item2")
		load_inventory(item, 2)
	else:
		inventory.items[2] = null
	if Settings.game_data.get("item3") != null:
		var item = Settings.game_data.get("item3")
		load_inventory(item, 3)
	else:
		inventory.items[3] = null
	if Settings.game_data.get("item4") != null:
		var item = Settings.game_data.get("item4")
		load_inventory(item, 4)
	else:
		inventory.items[4] = null
	if Settings.game_data.get("item5") != null:
		var item = Settings.game_data.get("item5")
		load_inventory(item, 5)
	else:
		inventory.items[5] = null
	if Settings.game_data.get("item6") != null:
		var item = Settings.game_data.get("item6")
		load_inventory(item, 6)
	else:
		inventory.items[6] = null
	if Settings.game_data.get("item7") != null:
		var item = Settings.game_data.get("item7")
		load_inventory(item, 7)
	else:
		inventory.items[7] = null
	if Settings.game_data.get("item8") != null:
		var item = Settings.game_data.get("item8")
		load_inventory(item, 8)
	else:
		inventory.items[8] = null
	if Settings.game_data.get("item9") != null:
		var item = Settings.game_data.get("item9")
		load_inventory(item, 9)
	else:
		inventory.items[9] = null
	if Settings.game_data.get("item10") != null:
		var item = Settings.game_data.get("item10")
		load_inventory(item, 10)
	else:
		inventory.items[10] = null
	if Settings.game_data.get("item11") != null:
		var item = Settings.game_data.get("item11")
		load_inventory(item, 11)
	else:
		inventory.items[11] = null
	if Settings.game_data.get("item12") != null:
		var item = Settings.game_data.get("item12")
		load_inventory(item, 12)
	else:
		inventory.items[12] = null
	if Settings.game_data.get("item13") != null:
		var item = Settings.game_data.get("item13")
		load_inventory(item, 13)
	else:
		inventory.items[13] = null
	if Settings.game_data.get("item14") != null:
		var item = Settings.game_data.get("item14")
		load_inventory(item, 14)
	else:
		inventory.items[14] = null
	if Settings.game_data.get("item15") != null:
		var item = Settings.game_data.get("item15")
		load_inventory(item, 15)
	else:
		inventory.items[15] = null
	if Settings.game_data.get("item16") != null:
		var item = Settings.game_data.get("item16")
		load_inventory(item, 16)
	else:
		inventory.items[16] = null
	if Settings.game_data.get("item17") != null:
		var item = Settings.game_data.get("item17")
		load_inventory(item, 17)
	else:
		inventory.items[17] = null
	if Settings.game_data.get("item18") != null:
		var item = Settings.game_data.get("item18")
		load_inventory(item, 18)
	else:
		inventory.items[18] = null
	if Settings.game_data.get("item19") != null:
		var item = Settings.game_data.get("item19")
		load_inventory(item, 19)
	else:
		inventory.items[19] = null
	if Settings.game_data.get("item20") != null:
		var item = Settings.game_data.get("item20")
		load_inventory(item, 20)
	else:
		inventory.items[20] = null
	if Settings.game_data.get("item21") != null:
		var item = Settings.game_data.get("item21")
		load_inventory(item, 21)
	else:
		inventory.items[21] = null
	if Settings.game_data.get("item22") != null:
		var item = Settings.game_data.get("item22")
		load_inventory(item, 22)
	else:
		inventory.items[22] = null
	if Settings.game_data.get("item23") != null:
		var item = Settings.game_data.get("item23")
		load_inventory(item, 23)
	else:
		inventory.items[23] = null
		
		
	
	if Settings.game_data.get("item0amount") != null:
		inventory.items[0].amount = Settings.game_data.get("item0amount")
	if Settings.game_data.get("item1amount") != null:
		inventory.items[1].amount = Settings.game_data.get("item1amount")
	if Settings.game_data.get("item2amount") != null:
		inventory.items[2].amount = Settings.game_data.get("item2amount")
	if Settings.game_data.get("item3amount") != null:
		inventory.items[3].amount = Settings.game_data.get("item3amount")
	if Settings.game_data.get("item4amount") != null:
		inventory.items[4].amount = Settings.game_data.get("item4amount")
	if Settings.game_data.get("item5amount") != null:
		inventory.items[5].amount = Settings.game_data.get("item5amount")
	if Settings.game_data.get("item6amount") != null:
		inventory.items[6].amount = Settings.game_data.get("item6amount")
	if Settings.game_data.get("item7amount") != null:
		inventory.items[7].amount = Settings.game_data.get("item7amount")
	if Settings.game_data.get("item8amount") != null:
		inventory.items[8].amount = Settings.game_data.get("item8amount")
	if Settings.game_data.get("item9amount") != null:
		inventory.items[9].amount = Settings.game_data.get("item9amount")
	if Settings.game_data.get("item10amount") != null:
		inventory.items[10].amount = Settings.game_data.get("item10amount")
	if Settings.game_data.get("item11amount") != null:
		inventory.items[11].amount = Settings.game_data.get("item11amount")
	if Settings.game_data.get("item12amount") != null:
		inventory.items[12].amount = Settings.game_data.get("item12amount")
	if Settings.game_data.get("item13amount") != null:
		inventory.items[13].amount = Settings.game_data.get("item13amount")
	if Settings.game_data.get("item14amount") != null:
		inventory.items[14].amount = Settings.game_data.get("item14amount")
	if Settings.game_data.get("item15amount") != null:
		inventory.items[15].amount = Settings.game_data.get("item15amount")
	if Settings.game_data.get("item16amount") != null:
		inventory.items[16].amount = Settings.game_data.get("item16amount")
	if Settings.game_data.get("item17amount") != null:
		inventory.items[17].amount = Settings.game_data.get("item17amount")
	if Settings.game_data.get("item18amount") != null:
		inventory.items[18].amount = Settings.game_data.get("item18amount")
	if Settings.game_data.get("item19amount") != null:
		inventory.items[19].amount = Settings.game_data.get("item19amount")
	if Settings.game_data.get("item20amount") != null:
		inventory.items[20].amount = Settings.game_data.get("item20amount")
	if Settings.game_data.get("item21amount") != null:
		inventory.items[21].amount = Settings.game_data.get("item21amount")
	if Settings.game_data.get("item22amount") != null:
		inventory.items[22].amount = Settings.game_data.get("item22amount")
	if Settings.game_data.get("item23amount") != null:
		inventory.items[23].amount = Settings.game_data.get("item23amount")
	print(Settings.game_data)
	inventory.connect("items_changed", self, "_on_items_changed")
	inventory.make_items_unique()

	
	
	
	
	
	
	
	update_inventory_display()

func load_inventory(item, index):
	if item == "Apple Pie":
		inventory.items[index] = ApplePie
	if item == "Apple":
		inventory.items[index] = Apple
	if item == "Carrot":
		inventory.items[index] = Carrot
	if item == "Chamomile":
		inventory.items[index] = Chamomile
	if item == "Essential Oil":
		inventory.items[index] = EssentialOil
	if item == "Green Tea":
		inventory.items[index] = GreenTea
	if item == "Iron Sword":
		inventory.items[index] = IronSword
	if item == "Mustard Plant":
		inventory.items[index] = MustardPlant
	if item == "Oak Branch":
		inventory.items[index] = OakBranch
	if item == "Poison Mushroom":
		inventory.items[index] = PoisonMushroom
	if item == "Shiitake Mushroom":
		inventory.items[index] = ShiitakeMushroom
	if item == "Stone Dagger":
		inventory.items[index] = StoneDagger
	if item == "Wooden Sword":
		inventory.items[index] = WoodenSword

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
