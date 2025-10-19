extends Node

# Simply disables mapBoundary visibility whenever a new level is loaded. Purely for convenience on our end
func _on_levelOne_ready() -> void:
	get_node(".").visible = false

func _on_levelThree_ready() -> void:
	get_node(".").visible = false

func _on_levelTwo_ready() -> void:
	get_node(".").visible = false
