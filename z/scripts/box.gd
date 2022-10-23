extends KinematicBody2D
class_name MovableBlock
export var gravity = 100
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity.y += gravity
	velocity = move_and_slide(velocity)
	velocity = Vector2.ZERO
	
func slide(vector):
	velocity.x = vector.x
