extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await SceneTransitionAnimation.fade_out()
	MusicPlayer.stop()
	MusicPlayer.play("res://music/roman_music2.wav")
