extends Node
var level=1
var deadths=0


var BGRlist:PackedByteArray=[0,0,0]
var bestlevel=1
var extravars:PackedInt32Array=[0,0,0,0,0,0,0]
var trueupgradeset:PackedByteArray=[]
var inforeground=2

func turnoff(B,G,R,Btype,Gtype,rtype):
	var setup=[B,G,R]
var boss=0
var x=1
var y=1
var checkpintpos=Vector2(0,0)
var levelend=0
var flippuse=0
var puse=0
var checkpintpuse=0
var deadthpuse=0
