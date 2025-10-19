extends Area2D

func _on_end_flag_entered(body: Node2D) -> void:
	# Checks if the player entered the flag, if so move on to next level
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://scenes/levels/levelTwo.tscn")
