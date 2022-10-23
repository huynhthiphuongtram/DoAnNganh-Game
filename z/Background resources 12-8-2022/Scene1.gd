extends Node2D

var whitekey_taken = false
var in_whitechest_zone = false

var bluekey_taken = false
var in_bluechest_zone = false
func _ready():
	$StaticQuartzBody.visible = false
	$StaticQuartzBody/Area2D/CollisionShape2D.disabled = true

func _process(delta):
	if $KinematicBody2D/CharacterSprite/AudioStreamPlayer2D.playing == false:
		$KinematicBody2D/CharacterSprite/AudioStreamPlayer2D.play()
		
	if $GrassBackground/PuzzleSort/ChestStaticBody2D/ChestNo1/ChestOpened1.visible == true && $GrassBackground/PuzzleSort/ChestStaticBody2D/ChestNo2/ChestOpened2.visible == true:
		$StaticQuartzBody.visible = true
		$StaticQuartzBody/Area2D/CollisionShape2D.disabled = false
