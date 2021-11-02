extends Control


enum HEALTH {ONE,TWO,THREE,FOUR,FIVE}
var HealthShow = HEALTH

func _ready():
	
	globals.PlayerHP = 3
	get_node("BigCrystalSlot").play("Empty")

func _process(delta):
	
	if globals.PlayerHP == 1:
		HealthShow = HEALTH.ONE
	elif globals.PlayerHP == 2:
		HealthShow = HEALTH.TWO
	elif globals.PlayerHP == 3:
		HealthShow = HEALTH.THREE
	elif globals.PlayerHP == 4:
		HealthShow = HEALTH.FOUR
	elif globals.PlayerHP == 5:
		HealthShow = HEALTH.FIVE
	
	
	
	if HealthShow == HEALTH.ONE:
		get_node("CrystalHeart1").visible = true
		get_node("CrystalHeart2").visible = false
		get_node("CrystalHeart3").visible = false
		get_node("CrystalHeart4").visible = false
		get_node("CrystalHeart5").visible = false
	elif HealthShow == HEALTH.TWO:
		get_node("CrystalHeart1").visible = true
		get_node("CrystalHeart2").visible = true
		get_node("CrystalHeart3").visible = false
		get_node("CrystalHeart4").visible = false
		get_node("CrystalHeart5").visible = false
	elif HealthShow == HEALTH.THREE:
		get_node("CrystalHeart1").visible = true
		get_node("CrystalHeart2").visible = true
		get_node("CrystalHeart3").visible = true
		get_node("CrystalHeart4").visible = false
		get_node("CrystalHeart5").visible = false
	elif HealthShow == HEALTH.FOUR:
		get_node("CrystalHeart1").visible = true
		get_node("CrystalHeart2").visible = true
		get_node("CrystalHeart3").visible = true
		get_node("CrystalHeart4").visible = true
		get_node("CrystalHeart5").visible = false
	elif HealthShow == HEALTH.FIVE:
		get_node("CrystalHeart1").visible = true
		get_node("CrystalHeart2").visible = true
		get_node("CrystalHeart3").visible = true
		get_node("CrystalHeart4").visible = true
		get_node("CrystalHeart5").visible = true
	else:
		print ("what did you do to your god damn health?")
	
	#if Input.is_key_pressed(KEY_1):
		#globals.PlayerHP = 1
		#print("1")
	#elif Input.is_key_pressed(KEY_4):
		#globals.PlayerHP = 4
		#print("4")
	#elif Input.is_key_pressed(KEY_5):
		#globals.PlayerHP = 5
		#print("5")
	
	
	
	if Input.is_key_pressed(KEY_E):
		globals.CurrentBigCrystal = globals.BIGCRYSTAL.EMPTY
	
	#elif Input.is_key_pressed(KEY_):
		#globals.CurrentBigCrystal = globals.BIGCRYSTAL.YELLOW
	
	#elif Input.is_key_pressed(KEY_R):
		#globals.CurrentBigCrystal = globals.BIGCRYSTAL.RED
	
	#elif Input.is_key_pressed(KEY_B):
		#globals.CurrentBigCrystal = globals.BIGCRYSTAL.BLUE
	
	#elif Input.is_key_pressed(KEY_G):
		#globals.CurrentBigCrystal = globals.BIGCRYSTAL.GREEN
	
	
	
	if globals.CurrentBigCrystal == globals.BIGCRYSTAL.EMPTY:
		get_node("BigCrystalSlot").play("Empty")
	elif globals.CurrentBigCrystal == globals.BIGCRYSTAL.YELLOW:
		get_node("BigCrystalSlot").play("Yellow")
	elif globals.CurrentBigCrystal == globals.BIGCRYSTAL.BLUE:
		.get_node("BigCrystalSlot").play("Blue")
	elif globals.CurrentBigCrystal == globals.BIGCRYSTAL.GREEN:
		get_node("BigCrystalSlot").play("Green")
	elif globals.CurrentBigCrystal == globals.BIGCRYSTAL.RED:
		get_node("BigCrystalSlot").play("Red")
	else:
		print("what the fuck what did you do")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
