extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _process(delta):
	
	if Input.is_key_pressed(KEY_E):
		globals.CurrentBigCrystal = globals.BIGCRYSTAL.EMPTY
	
	#elif Input.is_key_pressed(KEY_Y):
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
		print ("what the fuck what did you do")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
