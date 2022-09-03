extends KinematicBody2D

var velocity = Vector2.ZERO
var jump_speed = 8
var gravity = 40

onready var animationPlayer = $AnimationPlayer

func gravity(delta):
	velocity.y = velocity.y + gravity * delta
	if Input.is_action_pressed("ui_space"):
		if(is_on_floor()):
			velocity.y = velocity.y - jump_speed
	velocity = move_and_slide(velocity,Vector2.UP)
	
func _physics_process(delta):
	gravity(delta)
	
	#Movement
	if Input.is_action_pressed("ui_right"):
		velocity.x = 2
		animationPlayer.play("RightAnimation")
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -2
		animationPlayer.play("LeftAnimation")
	
	#Attack
	elif Input.is_action_pressed("ui_attack_buttonX"):
		animationPlayer.play("FightingOnRight")
	elif Input.is_action_pressed("ui_attack_buttonZ"):
		animationPlayer.play("FightingOnLeft")
	
	#NotMoving
	else:
		velocity.x = 0
		animationPlayer.stop()
	
	move_and_collide(velocity)
	
func _on_FallArea_body_entered(body):
	get_tree().change_scene("res://Background resources 29-8-2022/Scene2.tscn")

