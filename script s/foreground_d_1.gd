extends TileMapLayer


# Called when the node enters the scene tree for the first time.
@onready var anim=$AnimationPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Stat.inforeground==0:
		anim.play("new_animation_2",-1,1.0,false)
		Stat.inforeground+=2
	
	
	
	
	if Stat.inforeground==1:
		anim.play("new_animation",-1,1.0,false)
		Stat.inforeground+=1
