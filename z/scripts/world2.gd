extends Node2D

var game_end = false

func _process(delta):
	if game_end == false:
		var spots = $spots.get_child_count()
		for i in $spots.get_children():
			if i.occ:
				spots -= 1
		if spots == 0:
			get_tree().change_scene("res://stages/Game_over_2.tscn")
			game_end = true
