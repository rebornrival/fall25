extends Node2D

var fall_speed = 300.0 # Speed of falling rock!

var is_falling = false #Is the rock falling currently?

@onready var killbox = $Killbox
@onready var trigger_area = $TriggerArea
@onready var self_destruct_timer = $SelfDestructTimer

func _physics_process(delta: float) -> void:
	if is_falling:
		global_position.y += fall_speed * delta

# When TriggerArea entered, cause rock to begin falling and its self destruct timer to begin
func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		is_falling = true
		self_destruct_timer.start()

func _on_self_destruct_timer_timeout() -> void:
	queue_free()


func _on_killbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.die()
