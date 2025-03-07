extends Node2D


# Called when the node enters the scene tree for the first tim


@onready var main_d_1: TileMapLayer = $mainD1
static var _status=null

func _ready() -> void:
	_status=self
	$paye/AnimationPlayer.play("new_animation")
	


static func tile_lore_of(pos:Vector2) -> void:
	var local_pos:Vector2i=_status.main_d_1.local_to_map(pos)
	return _status.main_d_1.get_cell_tile_data(local_pos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $paye/deadtime.time_left>0:
		modulate=Color(.5,.5,.5,1)
	else:
		modulate=Color(1,1,1,1)
