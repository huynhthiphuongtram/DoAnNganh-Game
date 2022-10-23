extends StaticBody2D

var quartz_taken = false

func _on_Area2D_body_entered(body: PhysicsBody2D):
	quartz_taken = true
	print(quartz_taken)
	get_tree().change_scene("res://stages/Select_map.tscn")
