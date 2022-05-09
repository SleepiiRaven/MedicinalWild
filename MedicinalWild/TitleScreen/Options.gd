extends Control


onready var display_options_btn = $CenterContainer/VBoxContainer/Button
onready var vsync_btn = $CenterContainer/VBoxContainer/Button2
onready var brightness_btn = $CenterContainer/VBoxContainer/Button3
onready var audio_menu_btn = $CenterContainer/VBoxContainer/Button4

var fscreen = false
var vsync = false

func _ready():
	$CenterContainer/VBoxContainer/Button.grab_focus()
	if fscreen == false:
		display_options_btn.text = "Display Mode: Windowed"
	else:
		display_options_btn.text = "Display Mode: Fullscreen"
	if vsync == false:
		vsync_btn.text = "Vsync: Off"
	else:
		vsync_btn.text = "Vsync: On"
func _on_Button_pressed():

	if fscreen == false:
		fscreen = true
		PlayerStats.toggle_fullscreen(true)
		display_options_btn.text = "Display Mode: Fullscreen"
	else:
		fscreen = false
		PlayerStats.toggle_fullscreen(false)
		display_options_btn.text = "Display Mode: Windowed"

func _on_Button2_pressed():
	if vsync == false:
		vsync = true
		PlayerStats.toggle_vsync(true)
		vsync_btn.text = "Vsync: On"
	else:
		vsync = false
		PlayerStats.toggle_vsync(false)
		vsync_btn.text = "Vsync: Off"


func _on_Button3_pressed():

	get_tree().change_scene("res://TitleScreen/Control.tscn")

func _on_Button4_pressed():
	
	get_tree().change_scene("res://TitleScreen/TitleScreen.tscn")



