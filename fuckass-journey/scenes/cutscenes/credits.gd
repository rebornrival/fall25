extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await SceneTransitionAnimation.fade_out()
	
func _on_back_to_main_menu_pressed() -> void:
	await SceneTransitionAnimation.fade_in()
	get_tree().change_scene_to_file("res://scenes/menus/mainMenu.tscn")
