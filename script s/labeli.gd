extends Label

func _ready() -> void:
	self.visible=false
	
func _process(delta: float) -> void:
	if Stat.puse==1:
		self.visible=true
		
	else:
		self.visible=false
	
	
