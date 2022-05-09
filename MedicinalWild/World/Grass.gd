extends Node2D

#preload scene
const GrassEffect = preload("res://Effects/GrassEffect.tscn")

func create_grass_effect():
	#create grass effect scene
	#create an instance of it
	var grassEffect = GrassEffect.instance()
	#puts the grass effect into the world
	get_parent().add_child(grassEffect)
	grassEffect.global_position = global_position
	#put the object in queue to delete it from the game's memory
	queue_free()

func _on_HurtBox_area_entered(_area):
	create_grass_effect()
	#rand_range() outputs a random range, but it can be a decimal, so you round it to make it an integer to delete it from the game's memory
		
	queue_free()
