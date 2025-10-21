extends Control

func _ready() -> void:
	await SceneTransitionAnimation.fade_out()
	
func _on_timer_timeout() -> void:
	await SceneTransitionAnimation.fade_in()
	get_tree().change_scene_to_file("res://scenes/intro_sequence/intro_sequence_2.tscn")
