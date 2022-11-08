extends KinematicBody2D

var velocity = Vector2.ZERO
var jump_speed = 7
var gravity = 20
var attack_status = false
var character_death = false

onready var animationPlayer = $PlayerAnimatedSprite

func gravity(delta):
	velocity.y = velocity.y + gravity * delta
	if Input.is_action_pressed("jump"):
		if(is_on_floor()):
			velocity.y = velocity.y - jump_speed
	velocity = move_and_slide(velocity,Vector2.UP)
	
func _process(delta):
	gravity(delta)
	
	#Movement
	if Input.is_action_pressed("ui_right") && attack_status == false:
		velocity.x = 2
		animationPlayer.play("MoveRight")
		
	elif Input.is_action_pressed("ui_left") && attack_status == false:
		velocity.x = -2
		animationPlayer.play("MoveLeft")
	else:
		velocity.x = 0
		if attack_status == false:
			animationPlayer.stop()
			
	#Attack		
	if Input.is_action_just_pressed("ui_attack_buttonX"):
		animationPlayer.play("AttackRight")
		attack_status = true
		$AttackRightArea/CollisionShape2D.disabled = false
	elif Input.is_action_just_pressed("ui_attack_buttonZ"):
		animationPlayer.play("AttackLeft")
		attack_status = true
		$AttackLeftArea/CollisionShape2D.disabled = false
		
	#Attack
	#elif Input.is_action_pressed("ui_attack_buttonX"):
		#animationPlayer.play("AttackRight")
		#attack_status = true
		#$AttackRightArea/CollisionShape2D.disabled = false
		
	#elif Input.is_action_pressed("ui_attack_buttonZ"):
		#animationPlayer.play("AttackLeft")
		#attack_status = true
		#$AttackLeftArea/CollisionShape2D.disabled = false
			
	#NotMoving
	#else:
		#velocity.x = 0
		#animationPlayer.stop()
	
	move_and_collide(velocity)
	
func _on_FallArea_body_entered(body):
	get_tree().change_scene("res://Background resources 29-8-2022/Scene2.tscn")



func _on_PlayerAnimatedSprite_animation_finished():
	if animationPlayer.animation == "AttackRight":
		$AttackRightArea/CollisionShape2D.disabled = true
		attack_status = false
	if animationPlayer.animation == "AttackLeft":
		$AttackLeftArea/CollisionShape2D.disabled = true
		attack_status = false
		

var quartz_taken = false
func _on_QuartzShowUp_area_entered(area):
	quartz_taken = true
	print(quartz_taken)
	get_tree().change_scene("res://stages/Select_map.tscn")
