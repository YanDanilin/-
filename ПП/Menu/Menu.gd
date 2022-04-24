extends Control


var new_game = "res://Base/Base.tscn"


func _ready():
	$VBoxContainer/VBoxContainer2/Start.grab_focus()

func _on_Start_pressed():
	get_tree().change_scene(new_game)
	print("Start")

func _on_Exit_pressed():
	get_tree().quit()
	print("Exit")
