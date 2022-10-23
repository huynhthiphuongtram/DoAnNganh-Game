extends StaticBody2D

signal chest_opened
signal chest_closed

var whitekey_taken = false
var in_whitechest_zone = false



func _on_AreaKey_body_entered(body: PhysicsBody2D):
	if whitekey_taken == false:
		whitekey_taken = true
		$WhiteKey.queue_free()

func _input(event):
	if whitekey_taken == true:
		if in_whitechest_zone == true:
			if Input.is_key_pressed(KEY_F):
				print("chest_opened")
				emit_signal ("chest_opened")


func _on_ChestNo1_body_entered(body):
	in_whitechest_zone = true
	print(in_whitechest_zone)


func _on_ChestNo1_body_exited(body):
	in_whitechest_zone = false
	print(in_whitechest_zone)
