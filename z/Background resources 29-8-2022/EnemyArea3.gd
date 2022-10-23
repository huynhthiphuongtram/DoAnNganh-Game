extends Area2D
var dead = false

func _ready():
	pass

func _process(delta):
	if dead == false:
		$AnimatedSprite3.play("Idle")


func _on_EnemyArea3_area_entered(area):
	if area.is_in_group("Sword"):
		dead = true
		$AnimatedSprite3.play("Destroy")

func _on_AnimatedSprite3_animation_finished():
	if $AnimatedSprite3.animation == "Destroy":
		queue_free()
