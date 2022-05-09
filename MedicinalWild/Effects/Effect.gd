extends AnimatedSprite

#on ready
func _ready():
	# warning-ignore:return_value_discarded
	connect("animation_finished", self, "_on_animation_finished")
	#set the frame to 0, then play the animation
	frame = 0
	play("Animate")

func _on_animation_finished():
	queue_free()

