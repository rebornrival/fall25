extends CharacterBody2D

const SPEED = 230.0
const JUMP_VELOCITY = -440.0

var can_jump = true

@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	animated_sprite.play("walk_right")
# Brings Player to game over screen once killed
func die() -> void:
	# Uses call_deferred because Godot really doesn't like changing scenes while actively calculating physics
	# Waits until Godot is "idle" to change scene.
	get_tree().call_deferred("change_scene_to_file", ("res://scenes/menus/gameOver.tscn"))

func _physics_process(delta: float) -> void:
	
	# If we are on the floor, we can jump
	if can_jump == false and is_on_floor():
		can_jump = true
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and can_jump:
		jump()
		
	# As soon as we leave a platform, begin Coyote time
	if (is_on_floor() == false) and can_jump and $CoyoteTimer.is_stopped():
		$CoyoteTimer.start()
		
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	# Handles all movement animations
	animation_handler()
	
	move_and_slide()

func jump():
	velocity.y = JUMP_VELOCITY
	can_jump = false

# Once coyote time runs out, player can no longer jump
func _on_coyote_timer_timeout() -> void:
	can_jump = false

# If the player collides with a damaging terrain object, kill them
func _on_death_detector_body_entered(_body: Node2D) -> void:
	die()
	
func animation_handler() -> void:
	
	var moving_right = velocity.x > 0
	var moving_left = velocity.x < 0
	
	if moving_left:
		animated_sprite.play("walk_left")
	elif moving_right:
		animated_sprite.play("walk_right")
	else:
		animated_sprite.stop()
