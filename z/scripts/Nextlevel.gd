extends Area2D

export (String,FILE, ".tscn") var next_level

#func _ready():
#	pass

func _on_Area2D_body_entered(body, delay=0.5):
	var body_check = get_overlapping_bodies()
	for body in body_check:
		if body.name == "player":
			get_tree().change_scene(next_level)
	pass 

