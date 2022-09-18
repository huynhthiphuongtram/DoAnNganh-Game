extends Area2D

var dead = false

func _ready():
	pass

func _process(delta):
	if dead == false:
		$AnimatedSprite.play("Idle")


func _on_EnemyArea_area_entered(area):
	if area.is_in_group("Sword"):
		dead = true
		$AnimatedSprite.play("Destroy")


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Destroy":
		queue_free()
