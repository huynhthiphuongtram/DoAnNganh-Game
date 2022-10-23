extends StaticBody2D

signal chest_opened
signal chest_closed

var bluekey_taken = false
var in_bluechest_zone = false



func _on_AreaKey_body_entered(body: PhysicsBody2D):
	if bluekey_taken == false:
		bluekey_taken = true
		$BlueKey.queue_free()


func _input(event):
	if  bluekey_taken == true:
		if in_bluechest_zone == true:
			if Input.is_key_pressed(KEY_F):
				print("chest_opened")
				emit_signal ("chest_opened")
	

func _on_ChestNo2_body_entered(body):
	in_bluechest_zone = true
	print(in_bluechest_zone)


func _on_ChestNo2_body_exited(body):
	in_bluechest_zone = false
	print(in_bluechest_zone)
