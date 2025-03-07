extends Area2D
@onready var animetion=$AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimatedSprite2D/Sprite2D/AnimationPlayer

var state=0
func _process(delta: float) -> void:
	
	animetion.play("effect")
	animation_player.play("new_animation")

func _on_body_entered(body: Node2D) -> void:
	if state==0:
		Stat.extravars[0]+=1
		state=1
		visible=false
	else:
		pass
