extends Control


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		$TextureRect.visible = new_pause_state

func _on_Button_pressed():
	var state = not get_tree().paused
	get_tree().paused = state
	$TextureRect.visible = state
	


#func _on_TextureRect2_mouse_entered():
#	$TextureRect2.Color
