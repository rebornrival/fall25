extends Node2D

@onready var _player = $AudioStreamPlayer

func play(track_url: String) -> void:
	var new_track = load(track_url)
	_player.stream = new_track
	_player.play()

func stop():
	_player.stop()
