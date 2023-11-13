extends CharacterBody2D


var speed = 600

func _ready():
	$"../CountdownTimer".start()

func start_ball():
	randomize()
	velocity.x = [-1,1][randi() % 2] * speed
	velocity.y = [-0.8,0.8][randi() % 2] * speed
	
func _physics_process(delta):
	var collision_object = move_and_collide(velocity * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.get_normal())
		$"../CollisionSound".play()

func stop_ball():
	speed = 0
	start_ball()

func restart_ball():
	speed = 600
	start_ball()

