extends CanvasLayer
@onready var anim_player = $SceneTransitionAnimation/AnimationPlayer

signal fade_finished

func fade_in():
	anim_player.play("fade_in")
	await anim_player.animation_finished
	emit_signal("fade_finished")
	

func fade_out():
	anim_player.play("fade_out")
	await anim_player.animation_finished
	emit_signal("fade_finished")
	
