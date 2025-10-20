extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await SceneTransitionAnimation.fade_out()
	
# Restarts game back to level one
func _on_try_again_pressed() -> void:
	await SceneTransitionAnimation.fade_in()
	get_tree().change_scene_to_file("res://scenes/levels/levelOne.tscn")

# Brings player back to main menu
func _on_return_to_main_menu_pressed() -> void:
	await SceneTransitionAnimation.fade_in()
	get_tree().change_scene_to_file("res://scenes/menus/mainMenu.tscn")
