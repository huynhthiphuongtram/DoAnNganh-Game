extends CanvasLayer

var coins_total = 0

func _ready():
	$coins.text = String(coins_total)


func _on_coin_collected():
	coins_total = coins_total + 1
	_ready()
	if coins_total == 37:
		get_tree().change_scene("res://stages/Game_over.tscn")
