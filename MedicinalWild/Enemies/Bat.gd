extends KinematicBody2D

#preload
const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

#export vars
export var ACCELERATION = 300
export var MAX_SPEED = 50
export var FRICTION = 200
export var WANDER_TARGET_RANGE = 5

#state machine
enum {
	IDLE,
	WANDER,
	CHASE
}

#create velocity
var velocity = Vector2.ZERO

#set knockback to 0, 0
var knockback = Vector2.ZERO

#create state
var state = CHASE

#grab the animated sprite
onready var sprite = $Sprite
#grab the stats
onready var stats = $Stats
#grab the detection zone
onready var playerDetectionZone = $PlayerDetectionZone
onready var hurtbox = $HurtBox
onready var softCollision = $SoftCollision
onready var wanderController = $WanderController
onready var animationPlayer = $AnimationPlayer

#every step
func _physics_process(delta):
	#knockback slows down until 0, 0 by 200*delta each step
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	#move
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_player()
			
			if wanderController.get_time_left() == 0:
				#call on pick random state
				state = pick_random_state([IDLE, WANDER])
				wanderController.start_wander_timer(rand_range(1, 3))
		WANDER:
			seek_player()
			
			if wanderController.get_time_left() == 0:
				#call on pick random state
				state = pick_random_state([IDLE, WANDER])
				wanderController.start_wander_timer(rand_range(1, 3))
			
			var direction = global_position.direction_to(wanderController.target_position)
			velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
			sprite.flip_h = velocity.x < 0
			
			
			if global_position.distance_to(wanderController.target_position) <= WANDER_TARGET_RANGE:
				state = pick_random_state([IDLE, WANDER])
				wanderController.start_wander_timer(rand_range(1, 3))
				
		CHASE:
			var player = playerDetectionZone.player
			if player != null:
				#get direction to player
				var direction = global_position.direction_to(player.global_position)
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
			else:
				state = IDLE
			sprite.flip_h = velocity.x < 0
			
	if softCollision.is_colliding():
		velocity += softCollision.get_push_vector() * delta * 400
	velocity = move_and_slide(velocity)
#look for player in zone
func seek_player():
	#check to see if player is seen
	if playerDetectionZone.can_see_player():
		#state is chase
		state = CHASE

func pick_random_state(state_list):
	#shuffle list
	state_list.shuffle()
	#pick first one
	return state_list.pop_front()
	#basically take a random state
	
#when hit by player
func _on_HurtBox_area_entered(area):
	stats.health -= area.damage
	#turn up knockback
	knockback = area.knockback_vector * 120
	hurtbox.create_hit_effect()
	hurtbox.start_invincibility(0.4)
#when don't have health
func _on_Stats_no_health():
	queue_free()
	var enemyDeathEffect = EnemyDeathEffect.instance()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position

func _on_HurtBox_invincibility_started():
	animationPlayer.play("Start")

func _on_HurtBox_invincibility_ended():
	animationPlayer.play("Stop")
