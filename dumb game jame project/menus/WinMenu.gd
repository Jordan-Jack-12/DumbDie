extends Node2D


func _ready() -> void:
	pass

func _on_replay_pressed() -> void:
	get_tree().reload_current_scene()

func _on_home_pressed() -> void:
	get_tree().change_scene("res://menus/MainMenu.tscn")
