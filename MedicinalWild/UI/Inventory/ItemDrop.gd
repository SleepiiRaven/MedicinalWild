extends KinematicBody2D

onready var inventory = preload("res://UI/Inventory/InventoryDisplay.tscn")

const ACCELERATION = 460
const MAX_SPEED = 225
var velocity = Vector2.ZERO
export var item = "res://Items/Apple.tres"

var player = null
var being_picked_up = false

	
func _process(delta):
	if being_picked_up == true:
		var direction = global_position.direction_to(player.global_position)
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
		
		var distance = global_position.distance_to(player.global_position)
		if distance < 4:
			PlayerStats.get_node("PlayerInventory").picked_up_item = item
			
			queue_free()
	velocity = move_and_slide(velocity, Vector2.UP)

func pick_up_item(body):
	player = body
	being_picked_up = true
