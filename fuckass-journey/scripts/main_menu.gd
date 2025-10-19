extends Control

# Handles starting the game and loading the first level
func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/levelOne.tscn")

# Quits out of application
func _on_quit_pressed() -> void:
	get_tree().quit()
