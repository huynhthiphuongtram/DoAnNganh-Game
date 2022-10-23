extends KinematicBody2D

var audio_jump = load("res://sounds/jump.wav")

var velocity = Vector2.ZERO
var speed = 150

var jump_height = 65
var time_jump_apex = 0.4
var gravity 
var jump_force 

var on_ground = false
var can_double_jump = false
var is_double_jump = false




func _ready():
	pass

func _physics_process(delta):
	
	gravity = (2*jump_height) / pow(time_jump_apex,2)
	jump_force = gravity * time_jump_apex
	
	velocity.y += gravity * delta
	
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
		$Animation.flip_h = true
	elif Input.is_action_pressed("move_right"):
		velocity.x = speed
		$Animation.flip_h = false
	else:
		velocity.x = 0
		
	if Input.is_action_just_pressed("jump"):
		if on_ground:
			velocity.y = -jump_force
			on_ground = false
			$Audio.stream = audio_jump
			$Audio.play()
			can_double_jump = true
		else:
			if can_double_jump:
				velocity.y = -jump_force
				can_double_jump = false
				is_double_jump = true
			
	velocity = move_and_slide(velocity, Vector2.UP)
			
	if is_on_floor():
		on_ground = true
		can_double_jump = false
		is_double_jump = false
		if velocity.x == 0:
			$Animation.play("idle")
		else:
			$Animation.play("run")
	else:
		on_ground = false
		if velocity.y < 0:
			if is_double_jump:
				$Animation.play("double_jump")
			else:
				$Animation.play("jump")
		else:
			$Animation.play("fall")

	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider is MovableBlock:
			collision.collider.slide(-collision.normal* (speed/2))
	pass
	
func ouch():
	set_modulate(Color(1,0.3,0.3,0.3))
	velocity.y = -500 * 0.5
	
	$Timer.start()
	
func _on_Timer_timeout():
	get_tree().change_scene("res://stages/world.tscn")
