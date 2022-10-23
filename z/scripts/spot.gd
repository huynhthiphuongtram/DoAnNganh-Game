extends Area2D

var occ = false 

func _on_spot_body_entered(body):
	if body.is_in_group('box'):
		occ = true


func _on_spot_body_exited(body):
	if body.is_in_group('box'):
		occ = false






