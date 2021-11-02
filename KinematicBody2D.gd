extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()

var SlashReloadTime = 0.4
var JUMPHEIGHT = -600
var MOVESPEED = 400
var GRAVITY = 20
var MAXFALLSPEED = 650
var FASTFALLSPEED = 100
var MAXAIRJUMPS = 2
var AIRJUMPS = MAXAIRJUMPS
##var ISFLOORJUMPOK := true
onready var in_water := false

func _ready():
	get_node("SlashArea").monitoring = false

func _physics_process(delta):
	
	if get_node("SlashReload").is_stopped():
		if Input.is_key_pressed(KEY_X):
			print("attack!")
			get_node("SlashArea/SwordSprite").visible = true
			get_node("SlashArea/SwordSprite").play("LeftSlice")
			get_node("SlashArea").monitoring = true
			get_node("SlashReload").start(SlashReloadTime)
	else:
		get_node("SlashArea").monitoring = false
	#print(get_node("SlashArea/SwordSprite").get_sprite_frames())
	
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

	if in_water == true:
		AIRJUMPS = MAXAIRJUMPS
		motion = motion * 0.75
	#print(in_water)
	motion =  move_and_slide(motion, UP)
	globals.playerpos = self.global_position


##func _on_Coytime_timeout():
	##print("Coytime time out")
	##ISFLOORJUMPOK = false


func _on_Area2D_body_entered(body):
	if body.get_collision_layer_bit(0):
		print("Yeah for 0")
	if body.get_collision_layer_bit(1):
		print("Yeah for 1")
	print("Entered! while ", in_water, "Body:", body)
	in_water = true

func _on_Area2D_body_exited(body):
#	if body.is_in_group(PlayerGroup)
#		pass
		
	if body.get_collision_layer_bit(0):
		print("yeah for 0")
	if body.get_collision_layer_bit(1):
		print("yeah for 1")
		
	print("Exited! while ", in_water, "Body:", body)
	in_water = false
	
	


func _on_BlueCrystalPickup_body_entered(body):
	
	globals.CurrentBigCrystal = globals.BIGCRYSTAL.BLUE

func _on_GreenCrystalPickup_body_entered(body):
	
	globals.CurrentBigCrystal = globals.BIGCRYSTAL.GREEN

func _on_RedCrystalPickup_body_entered(body):
	
	globals.CurrentBigCrystal = globals.BIGCRYSTAL.RED


func _on_YellowCrystalPickup_body_entered(body):
	
	globals.CurrentBigCrystal = globals.BIGCRYSTAL.YELLOW


func _on_SwordSprite_animation_finished():
	print("attack stopped")
	get_node("SlashArea/SwordSprite").visible = false
	get_node("SlashArea/SwordSprite").stop()
	get_node("SlashArea/SwordSprite").set_frame(0)
