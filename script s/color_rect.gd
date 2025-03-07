extends ColorRect


var poscam=position

func _ready() -> void:
	poscam=position

func _process(delta: float) -> void:
	if Stat.checkpintpuse==1:
		poscam=position
		Stat.checkpintpuse-=1
	
	if Stat.deadthpuse==1:
		position=poscam
		Stat.deadthpuse-=1
	
