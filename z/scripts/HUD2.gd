extends CanvasLayer


var coins_total = 0

func _ready():
	$coins.text = String(coins_total)

func _on_coin_coin_collected():
	coins_total = coins_total + 1
	_ready()





