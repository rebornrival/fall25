extends Control

# Restarts game back to level one
func _on_try_again_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/levelOne.tscn")

# Brings player back to main menu
func _on_return_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/mainMenu.tscn")
