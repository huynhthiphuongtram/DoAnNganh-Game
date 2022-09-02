extends StaticBody2D

func _ready():
	$ChestNo1/ChestNotOpened1.visible = true
	$ChestNo1/ChestOpened1.visible = false
	
	$ChestNo2/ChestNotOpened2.visible = true
	$ChestNo2/ChestOpened2.visible = false


func _on_StaticWhiteKeyBody_chest_opened():
	$ChestNo1/ChestNotOpened1.visible = false
	$ChestNo1/ChestOpened1.visible = true


func _on_StaticBlueKeyBody_chest_opened():
	$ChestNo2/ChestNotOpened2.visible = false
	$ChestNo2/ChestOpened2.visible = true
