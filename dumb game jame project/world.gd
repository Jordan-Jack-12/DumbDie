extends Node2D
 
onready var winScreen = $WinMenu/CanvasLayer/Control
onready var elementSpawner = $elementSpawner/TimerSpawn

func _ready() -> void:
	$mainMusic.play()

func _on_Player_gameOver() -> void:
	$mainMusic.stop()
	$Player.visible = false
	$Player/CanvasLayer/Controller.visible = false
	$Player/CanvasLayer/UI/Label.rect_position.x=53
	$Player/CanvasLayer/UI/Label.rect_position.y= 87
	winScreen.visible = true
	elementSpawner.stop()
	
