extends Node2D


@export var health:float
@export var bleed:float
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	health-=bleed
