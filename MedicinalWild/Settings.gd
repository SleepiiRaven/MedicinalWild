extends Node

const SAVEFILE = "user://SAVEFILE.txt"

var options_data = {}
var game_data = {}

func _ready():
	load_data()
	
func load_data():
	var file = File.new()
	if not file.file_exists(SAVEFILE):
		options_data = {
			"fullscreen_on": false,
			"vsync_on": false,
			"brightness": 1,
			"master_vol": -10,
			"music_vol": -10,
			"sfx_vol": -10,
		}
		game_data = {
			"item0": null,
			"item1": null, 
			"item2": null, 
			"item3": null,
			"item4": null, 
			"item5": null, 
			"item6": null, 
			"item7": null, 
			"item8": null, 
			"item9": null, 
			"item10": null, 
			"item11": null, 
			"item12": null, 
			"item13": null, 
			"item14": null, 
			"item15": null, 
			"item16": null, 
			"item17": null, 
			"item18": null, 
			"item19": null, 
			"item20": null, 
			"item21": null, 
			"item22": null, 
			"item23": null,
			"item0amount": null,
			"item1amount": null, 
			"item2amount": null, 
			"item3amount": null,
			"item4amount": null, 
			"item5amount": null, 
			"item6amount": null, 
			"item7amount": null, 
			"item8amount": null, 
			"item9amount": null, 
			"item10amount": null, 
			"item11amount": null, 
			"item12amount": null, 
			"item13amount": null, 
			"item14amount": null, 
			"item15amount": null, 
			"item16amount": null, 
			"item17amount": null, 
			"item18amount": null, 
			"item19amount": null, 
			"item20amount": null, 
			"item21amount": null, 
			"item22amount": null, 
			"item23amount": null,
			"position": Vector2(121, 54),
			#upgrades?,
			"current_hp": 5
		}
		save_data()
	file.open(SAVEFILE, File.READ)
	game_data = file.get_var()
	options_data = file.get_var()
	file.close()
	
	
func save_data():
	var file = File.new()
	file.open(SAVEFILE, File.WRITE)
	file.store_var(game_data)
	file.store_var(options_data)
	file.close()
