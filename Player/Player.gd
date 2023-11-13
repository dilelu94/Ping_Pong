extends CharacterBody2D


var speed = 400.0

func _ready():
	$".".position.x = 35
	velocity.x = 0

func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
		
	move_and_slide()
