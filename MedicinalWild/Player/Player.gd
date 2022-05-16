extends KinematicBody2D


const PlayerHurtSound = preload("res://Music and Sounds/PlayerHurtSound.tscn")


#acceleration, makes it so you start out slow and speed up while you move
export  var ACCELERATION = 500
#w/exported variables you can change it in the inspector
export var MAX_SPEED =  80
#friction so you stop
export var FRICTION = 600
#speed for your roll
export var ROLL_SPEED = 120


#automatically creates these CONSTANT variables to set numbers, 1, 2, 3, 4, etc. commonly used for dates
enum {
	MOVE,
	ROLL,
	ATTACK,
	PAUSE
}

enum {
	MENU,
	INVENTORY
}

#state
var state = MOVE
#setting variable for velocity, has x and y in it, represents change of position
var velocity = Vector2.ZERO
#roll vector is down
var roll_vector = Vector2.DOWN
#grab your stats
var stats = PlayerStats
#pause type
var pause_type = null
# $ is a shortcut to get a node that is a child of you
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swordHitbox = $HitboxPivot/SwordHitbox
onready var hurtbox = $HurtBox
onready var blinkAnimationPlayer = $BlinkAnimationPlayer
onready var InventoryContainer = get_parent().get_parent().get_node("CanvasLayer/InventoryContainer")
onready var inventory = preload("res://UI/Inventory/Inventory.tres")
onready var inventory_items_array = preload("res://UI/Inventory/Inventory.tres").items

func _ready():
	#connect to function
	stats.connect("no_health", self, "die")
	animationTree.active = true;
	swordHitbox.knockback_vector = roll_vector
	global_position = Settings.game_data.get("position")
	stats.health = Settings.game_data.get("current_hp")

#Runs every tick, delta scales for low fps people
func _physics_process(delta):
	
	#its kinda like switch in gamemaker, you can just use if, elif, elif
	match state:
		MOVE:
			#we call move state here
			move_state(delta)
			
		ROLL:
			roll_state()
			
		ATTACK:
			attack_state()
			
		PAUSE:
			pause_state()

#move state, all the movement crap	
func move_state(delta):
	#create input vector
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	#NORMALIZE the vector, so diagonal won't be faster
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		#save vector
		roll_vector = input_vector
		swordHitbox.knockback_vector = roll_vector
		#animation
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Run")
		#calculate movement
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		#make friction happen, moves your speed towards 0,0
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	#actual movement
	move()
	
	if Input.is_action_just_pressed("roll"):
		state = ROLL
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
		
	if Input.is_action_just_pressed("inventory"):
		state = PAUSE
		pause_type = INVENTORY
		InventoryContainer.show()
		
	if Input.is_action_just_pressed("interact"):
		if $PickupZone.items_in_range.size() > 0:
			var pickup_item = $PickupZone.items_in_range.values()[0]
			pickup_item.pick_up_item(self)
			$PickupZone.items_in_range.erase(pickup_item)
		
	if Input.is_action_just_pressed("ui_cancel"):
		on_items_changed()
		Settings.game_data = {
			"item0": check_name(0),
			"item1": check_name(1),
			"item2": check_name(2),
			"item3": check_name(3),
			"item4": check_name(4),
			"item5": check_name(5),
			"item6": check_name(6),
			"item7": check_name(7),
			"item8": check_name(8),
			"item9": check_name(9),
			"item10": check_name(10),
			"item11": check_name(11),
			"item12": check_name(12),
			"item13": check_name(13),
			"item14": check_name(14),
			"item15": check_name(15),
			"item16": check_name(16),
			"item17": check_name(17),
			"item18": check_name(18),
			"item19": check_name(19),
			"item20": check_name(20),
			"item21": check_name(21),
			"item22": check_name(22),
			"item23": check_name(23),
			"position": position,
			"current_hp": stats.health
		}
		print(check_name(0))
		Settings.save_data()
		

func on_items_changed():
	inventory_items_array = load("res://UI/Inventory/Inventory.tres").items

func check_name(item_index):
	if inventory_items_array[item_index] != null:
		return inventory_items_array[item_index].name
	
#roll state
func roll_state():
	#make the velocity equal to the saved roll vector times the roll speed
	velocity = roll_vector * ROLL_SPEED
	#animate
	animationState.travel("Roll")
	#move
	move()

#attack state
func attack_state():
	#no longer remembers velocity during animation
	velocity = Vector2.ZERO
	#find easiest path to the attack animation
	animationState.travel("Attack")

func pause_state():
	velocity = Vector2.ZERO
	animationState.travel("Idle")
	if pause_type == INVENTORY:
		if Input.is_action_just_pressed("inventory"):
			InventoryContainer.hide()
			state = MOVE
	if Input.is_action_just_pressed("ui_cancel"):
		if pause_type == INVENTORY:
			InventoryContainer.hide()
		state = MOVE
	
func move():
	velocity = move_and_slide(velocity)

func roll_animation_finished():
	state = MOVE
	
#once the animation is finished
func attack_animation_finished():
	state = MOVE


func _on_HurtBox_area_entered(area):
	stats.health -= area.damage
	hurtbox.start_invincibility(0.6)
	hurtbox.create_hit_effect()
	var playerHurtSound = PlayerHurtSound.instance()
	get_tree().current_scene.add_child(playerHurtSound)

func _on_HurtBox_invincibility_started():
	blinkAnimationPlayer.play("Start")

func _on_HurtBox_invincibility_ended():
	blinkAnimationPlayer.play("Stop")
	

func die():
	queue_free()

