extends Popup
onready var inventory = get_node("../../../../")

	

func _process(_delta):

	if inventory.visible == false:

		visible = false
