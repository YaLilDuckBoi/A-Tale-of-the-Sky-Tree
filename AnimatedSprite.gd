extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"





# Called when the node enters the scene tree for the first time.
func _ready():
	
	if Input.is_action_pressed("ui_left"):
		frame = 0
	elif Input.is_action_pressed("ui_right"):
		frame = 1
	
	 # Replace with function body.
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		frame = 0
	elif Input.is_action_pressed("ui_right"):
		frame = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

