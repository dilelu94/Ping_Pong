extends CharacterBody2D

const SPEED = 250
var ball

func _ready():
	$".".position.x = 1280-35
	ball = get_parent().find_child("Ball")
	
func _physics_process(_delta):
	var direction = get_opponent_direction()
	velocity.y = direction * SPEED
	move_and_slide()
	
func get_opponent_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0
