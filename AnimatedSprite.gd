extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"





# Called when the node enters the scene tree for the first time.
func _ready():
	frame = 1
	flip_h = false
	
	 # Replace with function body.
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		flip_h = true
	elif Input.is_action_pressed("ui_right"):
		flip_h = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

