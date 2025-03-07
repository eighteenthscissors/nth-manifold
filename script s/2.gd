extends Node2D


# Called when the node enters the scene tree for the first tim
func _ready() -> void:
	$paye/AnimationPlayer.play("new_animation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
