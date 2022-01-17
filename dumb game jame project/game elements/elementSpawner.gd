extends Node2D

onready var Bomb = preload("res://game elements/bomb.tscn")
onready var Heart = preload("res://game elements/Heart.tscn")
onready var PowerUp = preload("res://game elements/PowerUp.tscn")
onready var position_spawn = $spwnerPositions.get_children()

func _ready() -> void:
	randomize()

func _on_TimerSpawn_timeout() -> void:
	var item = randi()%100
	var item1 = int(item)
	var index = randi()%2
	if item1 >= 50 and item <= 75:
		var bomb = Bomb.instance()
		bomb.global_position = position_spawn[index].global_position
		get_parent().add_child(bomb)
	elif item1 <= 50:
		var heart = Heart.instance()
		heart.global_position = position_spawn[index].global_position
		get_parent().add_child(heart)
	else:
		var powerUp = PowerUp.instance()
		powerUp.global_position = position_spawn[index].global_position
		get_parent().add_child(powerUp)
