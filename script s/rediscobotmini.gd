extends Area2D

@onready var anim=$AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Stat.boss==1:
		anim.play("new_animation")
		Stat.boss=0




func _on_body_entered(body: Node2D) -> void:
	Stat.boss=0
	Stat.extravars=[0,0,0,0,0,0,0]
	get_tree().reload_current_scene()
