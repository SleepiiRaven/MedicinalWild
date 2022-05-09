extends AnimatedSprite

#on ready
func _ready():
	connect("animation_finished", self, "_on_animation_finished")
	#set the frame to 0, then play the animation
	frame = 0
	play("Animate")

func _on_HurtBox_area_entered(area):
	if PlayerStats.health < PlayerStats.max_health:
		PlayerStats.health += 1
		queue_free()
