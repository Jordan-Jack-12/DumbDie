extends KinematicBody2D

signal gameOver

var state_machine

var inputVector = Vector2()
var velocity = Vector2()
var speed = 100
var gravity = 32
var jumpforce = 500

var hp = 100
var game = true
var score = 100

onready var animPlayer = $AnimationPlayer
onready var health = $CanvasLayer/UI/health
onready var scoreText = $CanvasLayer/UI/Label

#sounds
onready var blast = $blast

func _physics_process(delta: float) -> void:
	scoreText.set_text(String(score))
	health.value = hp
	if hp <= 0:
		game = false
		emit_signal("gameOver")
	if game:
		inputVector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
		velocity.x += inputVector.x * delta * speed
		velocity = move_and_slide(velocity, Vector2.UP)
		
		if inputVector.x == 0:
			velocity.x = lerp(velocity.x, 0, 0.15)
			if abs(velocity.x) < 0.1:
				velocity.x = 0
		
	if inputVector.x == 1 or inputVector.x == -1:
		animPlayer.play("walk")
	else:
		animPlayer.play("idle")
		
		velocity.y += gravity * delta
	
func getDamage(dvalue):
	animPlayer.play("hurt")
	hp -= dvalue
	health.value = hp
	score += 10
	
func getHealth():
	if hp == 100:
		hp += 0
	elif hp < 90:
		hp += 10
	else:
		hp = 100
	health.value = hp
	score += -5
	
func _on_elementsDetector_area_entered(area: Area2D) -> void:
	if area.is_in_group("bomb"):
		area.queue_free()
		getDamage(5)
		blast.play()
		
	if area.is_in_group("heart"):
		area.queue_free()
		getHealth()
		$coincollect.play()
		
	if area.is_in_group("pwrup"):
		area.queue_free()
		$powerup.play()
		$slowTimer.start()
		speed = 10

func _on_slowTimer_timeout() -> void:
	speed = 100
