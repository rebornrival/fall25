extends Control

@onready var lightning_strike = $LightningStirkeLOL
func _ready():
	await SceneTransitionAnimation.fade_out()
	lightning_strike.play()
	

func _on_timer_timeout() -> void:
	await SceneTransitionAnimation.fade_in()
	get_tree().change_scene_to_file("res://scenes/intro_sequence/intro_sequence_3.tscn")
