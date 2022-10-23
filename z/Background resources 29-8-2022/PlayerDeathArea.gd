extends Area2D

var character_death = false


func _ready():
	pass # Replace with function body.

func _on_PlayerDeathArea_area_entered(area):
	if area.is_in_group("Enemy"):
		character_death = true
		$PlayerAnimatedSprite.play("Destroy")


func _on_PlayerAnimatedSprite_animation_finished():
	if $PlayerAnimatedSprite.animation == "Destroy":
		get_tree().change_scene("res://Background resources 29-8-2022/Scene2.tscn")
