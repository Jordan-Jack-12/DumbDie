extends Area2D

class_name heart

var gravityBomb = 100

func _physics_process(delta: float) -> void:
	global_position.y += gravityBomb * delta
	rotation += 0.5 * delta

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
