extends Camera2D

var poscam=position

func _ready() -> void:
	poscam=position

func _process(delta: float) -> void:
	if Stat.checkpintpuse==1:
		poscam=position
		Stat.checkpintpuse-=1
	
	
	if Stat.deadthpuse>0:
		position=poscam
	
	

func _on_ycollison_body_entered(body: Node2D) -> void:
	if body.velocity.y<0:
		position.y-=160
		


func _on_xcollision_body_entered(body: Node2D) -> void:
	if body.velocity.x>0:
		position.x+=240
	


func _on_ycollisionreciprocal_body_entered(body: Node2D) -> void:
	if body.velocity.y>0:
		position.y+=160



func _on_xcollisionreciprocal_body_entered(body: Node2D) -> void:
	if body.velocity.x<0:
		position.x-=230
