extends Control

onready var music = $MainMusic

func _ready() -> void:
	music.play()

func _on_PlayButton_pressed() -> void:
	get_tree().change_scene("res://world.tscn")
