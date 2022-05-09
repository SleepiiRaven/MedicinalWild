extends Area2D

#create a player character
var player = null

func can_see_player():
	return player != null

#when the player enters the detection zone
func _on_PlayerDetectionZone_body_entered(body):
	player = body
#when the player exits the detection zone
func _on_PlayerDetectionZone_body_exited(_body):
	player = null
