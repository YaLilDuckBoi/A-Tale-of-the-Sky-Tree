extends KinematicBody2D

var motion = Vector2(0,0)

const DASHSPEED = 400.0
const FOLLOWSPEED = 200.0
const PREPTIME = 1.0
const DASHTIME = 0.7
const RECOVERYTIME = 1.0

var DashDirection := Vector2(0.0, 0.0)

func _ready():
	get_node("AnimatedSprite").play("IDLE")


enum behaviour {IDLE, DASHATTACKING, FOLLOWING, FLEEING, PREPDASH, RECOVERING}

var BatDoing = behaviour.IDLE

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if BatDoing == behaviour.IDLE:
		motion.x = 0
		motion.y = 0
	elif BatDoing == behaviour.DASHATTACKING:
		motion = DashDirection*DASHSPEED
	elif BatDoing == behaviour.FOLLOWING:
		motion = (globals.playerpos-self.global_position).normalized()*FOLLOWSPEED
	elif BatDoing == behaviour.PREPDASH:
		motion.x = 0
		motion.y = 0
	elif BatDoing == behaviour.RECOVERING:
		motion.x = 0
		motion.y = 0
	else:
		print ("What the fuck? How?")
	motion = move_and_slide(motion)

func _on_DMG_body_entered(body):
	set_behaviour_to_recovering()
	print ("Recovering :>")

func _on_AttackArea_body_entered(body):
		if get_node("Behaviourtimer").is_stopped():
			set_behaviour_to_prepdash()
			print ("Preptime :>")
	#remember to make indicator visual feedback


func _on_Behaviourtimer_timeout():
	if BatDoing == behaviour.PREPDASH:
		set_behaviour_to_dashattacking()
		print ("prep to Dashattacking :>")
	elif BatDoing == behaviour.DASHATTACKING:
		set_behaviour_to_recovering()
		print ("dash to Recoveringgg :>")
	elif BatDoing == behaviour.RECOVERING:
		if test_for_player_in_body_list(get_node("Attack").get_overlapping_bodies()):
			set_behaviour_to_prepdash()
			print ("recovering to Prepdashhh :>")
		elif test_for_player_in_body_list(get_node("Follow").get_overlapping_bodies()):
			set_behaviour_to_following()
			print ("recovering to Followinggg :>")
		else:
			set_behaviour_to_idle()
			print ("recovering to Idle :>")

func _on_Follow_body_entered(body):
	if get_node("Behaviourtimer").is_stopped():
		set_behaviour_to_following()
		print ("following :>")

func _on_Follow_body_exited(body):
	if get_node("Behaviourtimer").is_stopped():
		set_behaviour_to_idle()
		print ("following to Idle :>")

func _on_StopPrep_body_exited(body):
	if get_node("Behaviourtimer").is_stopped():
		set_behaviour_to_following()
		print ("prep to Followinnnng :>")

func set_behaviour_to_idle():
	BatDoing = behaviour.IDLE
	get_node("AnimatedSprite").play("IDLE")

func set_behaviour_to_following():
	BatDoing = behaviour.FOLLOWING
	get_node("AnimatedSprite").play("IDLE")

func set_behaviour_to_recovering():
	BatDoing = behaviour.RECOVERING
	get_node("AnimatedSprite").play("IDLE")
	get_node("Behaviourtimer").start(RECOVERYTIME)

func set_behaviour_to_prepdash():
	BatDoing = behaviour.PREPDASH
	get_node("AnimatedSprite").play("IDLE")
	get_node("Behaviourtimer").start(PREPTIME)

func set_behaviour_to_dashattacking():
	DashDirection = (globals.playerpos-self.global_position).normalized()
	BatDoing = behaviour.DASHATTACKING
	get_node("AnimatedSprite").play("ATTACK")
	get_node("Behaviourtimer").start(DASHTIME)

static func test_for_player_in_body_list(bodies) -> bool:
	var returnval := false
	for body in bodies:
		if body.name == "PlayerWiz":
			returnval = true
	return returnval
