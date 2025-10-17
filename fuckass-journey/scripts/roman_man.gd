extends CharacterBody2D

const SPEED = 250.0
const JUMP_VELOCITY = -440.0

var can_jump = true

var AnimPlayer

# Next two functions handle dying and being brought back to a certain point in level.
# Will be updated to prompt a menu later
var starting_position: Vector2
func _ready() -> void:
	starting_position = position

func die() -> void:
	position = starting_position
	velocity.y = 1000

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
	if Input.is_action_just_pressed("jump") and can_jump:
		jump()
	
	# As soon as we leave a platform, begin Coyote time
	if (is_on_floor() == false) and can_jump and $CoyoteTimer.is_stopped():
		$CoyoteTimer.start()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
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


func _on_touch_spikey_rock(_body: Node2D) -> void:
	die()


# handles player animation
func anim_left():
	if Input.is_action_pressed("left"):
		$AnimationPlayer.play("walk_left")
	if Input.is_action_just_released("left"):
		$AnimationPlayer.stop(false)


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()
