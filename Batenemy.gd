extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const PREPTIME = 0.5


enum behaviour {IDLE, DASHATTACKING, FOLLOWING, FLEEING, PREPDASH, RECOVERING}

var BatDoing = behaviour.IDLE

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	pass # Replace with function body.

func _on_DMG_body_entered(body):
	
	BatDoing = behaviour.RECOVERING
	
	pass # Replace with function body.


func _on_AttackArea_body_entered(body):
	
	BatDoing = behaviour.PREPDASH
	get_node("Behaviourtimer").start(PREPTIME)
	#remember to make indicator visual feedback
	
	pass # Replace with function body.


func _on_Behaviourtimer_timeout():
	if BatDoing == behaviour.PREPDASH:
		BatDoing = behaviour.DASHATTACKING
	
	pass # Replace with function body.



