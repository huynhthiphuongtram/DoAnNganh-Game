extends Control

func _on_Play_again_pressed():
	get_tree().change_scene("res://stages/world.tscn")


func _on_return_menu_pressed():
	get_tree().change_scene("res://stages/StartMenu.tscn")
