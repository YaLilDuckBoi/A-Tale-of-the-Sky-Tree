extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()

var JUMPHEIGHT = -600
var MOVESPEED = 400
var GRAVITY = 20
var MAXFALLSPEED = 650
var FASTFALLSPEED = 100
var MAXAIRJUMPS = 2
var AIRJUMPS = MAXAIRJUMPS
##var ISFLOORJUMPOK := true


func _physics_process(delta):
	
	if is_on_floor():
		AIRJUMPS = MAXAIRJUMPS
	
	if Input.is_action_pressed("ui_right"):
		motion.x = MOVESPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -MOVESPEED
	else:
		motion.x = 0
		
	##if is_on_floor():
		##ISFLOORJUMPOK = true
	##else:
		##ISFLOORJUMPOK = false
		##get_node("Coytime").start()
		
	##if ISFLOORJUMPOK:
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMPHEIGHT
	elif AIRJUMPS >= 1:
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMPHEIGHT
			AIRJUMPS -= 1
	if Input.is_action_pressed("ui_down"):
			motion.y += FASTFALLSPEED
			MAXFALLSPEED = 800
	else:
		MAXFALLSPEED = 550
		motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	motion =  move_and_slide(motion, UP)



##func _on_Coytime_timeout():
	##print("Coytime time out")
	##ISFLOORJUMPOK = false
