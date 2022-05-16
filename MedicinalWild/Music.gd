extends Node2D

signal fade_started

#music is annoying to do :( AAAAAAAAAAAAAAA

#TRANSITION FOR MUSIC
export var TRANSITION_DURATION = 4.0
export var TRANSITION_TYPE = 1 # TRANS_SINE

onready var mainMenuMusicPlayer = $MainMenuMusicPlayer
onready var musicPlayer = $MusicPlayer
onready var playerStats = PlayerStats
onready var tween_out = $Tween

func _ready():
	playerStats.connect("no_health", self, "complete_music")
	mainMenuMusicPlayer.play()


func change_vol(vol):
	musicPlayer.volume_db = vol 

func complete_music():
	fade_out(musicPlayer)	


func fade_out(stream_player):
	tween_out.interpolate_property(stream_player, "volume_db", 0, -80, TRANSITION_DURATION, TRANSITION_TYPE, Tween.EASE_IN, 0)
	tween_out.start()
	emit_signal("fade_started")

func change_music():
	if mainMenuMusicPlayer.playing:
		mainMenuMusicPlayer.playing = false
		musicPlayer.playing = true

	elif musicPlayer.playing:
		musicPlayer.playing = false
		mainMenuMusicPlayer.playing = true
		
	
	
func _on_Tween_tween_completed(object, _key):
	object.stop()
	object.volume_db = 0
	get_tree().quit()
