extends Button

var val=0

func _ready() -> void:
	self.visible=false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Stat.puse==1:
		self.visible=true
		
	else:
		self.visible=false
	
	
	



func _on_pressed() -> void:
	if Stat.puse==1:
		Stat.extrajumps+=Stat.jumpaddlist[Stat.mainist[2]-1]
		val=Stat.mainist[2]
		Stat.mainist.remove_at(2)
		Stat.puse=0
