extends KinematicBody2D
var velocity = Vector2.ZERO
onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = 2
		animationPlayer.play("RightMovement")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -2
		animationPlayer.play("LeftMovement")
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -2
		animationPlayer.play("UpMovement")
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 2
		animationPlayer.play("DownMovement")
	else:
		velocity.x = 0
		velocity.y = 0
		animationPlayer.play("IdleMovement")
	move_and_collide(velocity)
