extends Area2D

var dead = false

func _ready():
	pass

func _process(delta):
	if dead == false:
		$AnimatedSprite4.play("Idle")


func _on_EnemyArea4_area_entered(area):
	if area.is_in_group("Sword"):
		dead = true
		$AnimatedSprite4.play("Destroy")

func _on_AnimatedSprite4_animation_finished():
	if $AnimatedSprite4.animation == "Destroy":
		queue_free()
