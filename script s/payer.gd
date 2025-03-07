extends CharacterBody2D

@export var SPEED =0
@export var JUMP_VELOCITY = 0
@export var Flip=1
@export var grav=300
var buffer=false
var jump=false
@onready var catframes=$speedycatframes
@onready var dwadtime=$deadtime
@onready var sprite_2d: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	
	if Stat.levelend==0:
		Stat.x=position.x
		Stat.y=position.y
		var floored=is_on_floor()
		var ceilinged=is_on_ceiling()
		if not is_on_floor():
			velocity.y+= grav* delta *(1-Stat.puse)*Flip
		move_and_slide()
		if not is_on_floor():
			velocity.y+= grav* delta *(1-Stat.puse)*Flip
		var floornt=floored and Flip==1 and not is_on_floor() 
		var ceilingnt=ceilinged and Flip==-1 and not is_on_ceiling() 
		if floornt or ceilingnt and jump==true:
			catframes.start()
			
		if Input.is_action_just_pressed("ui_accept") and Stat.extravars[0]>0 and buffer==true :
			buffer==false
			jump=true
		if is_on_floor() or catframes.time_left>0 or is_on_ceiling() :
			if jump==true:
				Stat.extravars[0]-=1
				velocity.y = JUMP_VELOCITY*(1-Stat.puse)*Flip
				jump=false
		
			
		
		$Sprite2D/arml.rotation_degrees=-14+(velocity.x/4)
		$Sprite2D/armr.rotation_degrees=-14+(velocity.x/4)
		$Sprite2D/arml.position.y=-83.333-(velocity.y*1.4)
		$Sprite2D/armr.position.y=-83.333-(velocity.y*1.4)
		
		
		if Input.is_action_pressed("ui_left") and velocity.x>-60:
			velocity.x+=SPEED*delta*(-60)*(1-Stat.puse)
		elif Input.is_action_pressed("ui_right") and velocity.x<60:
			velocity.x+=SPEED*delta*60*(1-Stat.puse)
		
		if not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
			velocity.x*=0.5**60**delta
		
		if velocity.y>350 or velocity.y<-350:
			velocity*=0.95**60**delta
		if Stat.puse==1:
			velocity*=0
			visible=false
		else:
			visible=true
	else:
		visible=false
	
	
	if Stat.levelend==2:
		var level=get_tree().current_scene.scene_file_path.to_int()+1
		get_tree().change_scene_to_file("res://levels/"+str(level)+".tscn")
		Stat.levelend=0




func _on_flip_body_entered(body: Node2D) -> void:
	buffer=true




func _on_deadth_body_entered(body: Node2D) -> void:
	Engine.time_scale=0.1
	
	$CollisionShape2D3.set_deferred_thread_group("Disabled",true)
	$deadth/CollisionShape2D2.set_deferred_thread_group("Disabled",true)
	dwadtime.start()




func _on_checker_body_entered(body: Node2D) -> void:
	if body.is_in_group("foreground"):
		Stat.inforeground=1



func _on_checker_body_exited(body: Node2D) -> void:
	if body.is_in_group("foreground"):
		Stat.inforeground=0


func _on_buffer_body_exited(body: Node2D) -> void:
	if catframes.time_left>0:
		buffer=false


func _on_deadtime_timeout() -> void:
	$CollisionShape2D3.set_deferred_thread_group("Disabled",false)
	$deadth/CollisionShape2D2.set_deferred_thread_group("Disabled",false)
	Engine.time_scale=1
	Stat.boss=0
	Stat.extravars=[0,0,0,0,0,0,0]
	get_tree().reload_current_scene()
