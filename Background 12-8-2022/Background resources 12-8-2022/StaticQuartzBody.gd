extends StaticBody2D

var quartz_taken = false

func _on_Area2D_body_entered(body: PhysicsBody2D):
	print("ok")
	get_tree().change_scene("")
