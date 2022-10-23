extends Control

func _on_return_pressed():
	get_tree().change_scene("res://stages/StartMenu.tscn")

func _on_map1_pressed():
	get_tree().change_scene("res://Background resources 12-8-2022/Scene1.tscn")

func _on_map2_pressed():
	get_tree().change_scene("res://Background resources 29-8-2022/Scene2.tscn") 

func _on_map3_pressed():
	get_tree().change_scene("res://stages/world2.tscn")
	
func _on_map4_pressed():
	get_tree().change_scene("res://stages/world.tscn")
