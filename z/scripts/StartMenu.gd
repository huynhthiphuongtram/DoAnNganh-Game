extends Control



#func _ready():
#	pass


func _on_Startgamebutton_pressed():
	get_tree().change_scene("res://stages/Select_map.tscn")


func _on_Quitgamebutton_pressed():
	get_tree().quit()



