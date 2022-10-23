extends Area2D

var dead = false

func _ready():
	pass

func _process(delta):
	if dead == false:
		$AnimatedSprite2.play("Idle")


func _on_EnemyArea2_area_entered(area):
	if area.is_in_group("Sword"):
		dead = true
		$AnimatedSprite2.play("Destroy")

func _on_AnimatedSprite2_animation_finished():
	if $AnimatedSprite2.animation == "Destroy":
		queue_free()
