extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await SceneTransitionAnimation.fade_out()
	
# Handles starting the game and loading the first level
func _on_start_game_pressed() -> void:
	await SceneTransitionAnimation.fade_in()
	get_tree().change_scene_to_file("res://scenes/levels/levelOne.tscn")

# Quits out of application
func _on_quit_pressed() -> void:
	get_tree().quit()
