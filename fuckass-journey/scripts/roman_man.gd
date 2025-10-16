extends CharacterBody2D

const SPEED = 250.0
const JUMP_VELOCITY = -400.0

var can_jump = true


func _physics_process(delta: float) -> void:
	
	# If we are on the floor, we can jump
	if can_jump == false and is_on_floor():
		can_jump = true
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Controls the direction the sprite is facing based on last directional input
	if velocity.x < 0:
		get_node("Sprite2D").flip_h = true
	elif velocity.x > 0:
		get_node("Sprite2D").flip_h = false

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and can_jump:
		jump()
	
	# As soon as we leave a platform, begin Coyote time
	if (is_on_floor() == false) and can_jump and $CoyoteTimer.is_stopped():
		$CoyoteTimer.start()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	


	move_and_slide()

func jump():
	velocity.y = JUMP_VELOCITY
	can_jump = false

func _on_coyote_timer_timeout() -> void:
	can_jump = false
