extends Node2D

func _ready():
# warning-ignore:return_value_discarded
	Music.connect("fade_started", self, "start_red_fade")
	
func start_red_fade():
	$CanvasLayer/FadeInRed.show()
	$CanvasLayer/FadeInRed.fade_in()
