extends Area2D

func _ready() -> void:
	global_position=Vector2(Stat.upgposlist[(Stat.level*2)-1],Stat.upgposlist[(Stat.level*2)])
	
 
func _process(delta: float) -> void:
	if Stat.deadthpuse==1:
		Stat.deadthpuse-=1
		if Stat.level>1:
			Stat.level-=1
			global_position=Vector2(Stat.upgposlist[(Stat.level*2)-1],Stat.upgposlist[(Stat.level*2)])
func _on_body_entered(body: Node2D) :
	Stat.level+=1
	Stat.bestlevel=Stat.level
	global_position=Vector2(Stat.upgposlist[(Stat.level*2)-1],Stat.upgposlist[(Stat.level*2)])
	if Stat.level==4:
		get_tree().quit()
	Stat.puse=1



func _on_checkers_body_entered(body: Node2D) -> void:
	Stat.checkpintpos=position
	Stat.checkpintpuse=4
