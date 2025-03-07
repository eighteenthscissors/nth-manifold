extends Area2D

@onready var anim=$AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Stat.levelend==1 and anim.is_playing()==false:
		Stat.levelend=2



func _on_body_entered(body: Node2D) -> void:
	Stat.levelend=1
	Stat.extravars=[0,0,0,0,0,0,0]
	anim.play("new_animation")
