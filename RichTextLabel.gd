extends RichTextLabel

var DialoguePoint = [0, 0 , 0 , 0]
enum {GREENWIZ, BLUEWIZ, REDWIZ, YELLOWWIZ, NOONE}
var TalkingTo = NOONE

var GreenWiz_dia = ["Hej nr 1",
					"Farvel ne 2",
					"Er du her stadig?"]


func _ready():
	visible = false
	get_parent().visible = false


func _on_UpgradeArea_body_entered(body):
	visible = true
	get_parent().visible = true
	TalkingTo = GREENWIZ
	

func _physics_process(delta):
	if visible:
		if TalkingTo == NOONE:
			visible = false
			get_parent().visible = false
		if TalkingTo == GREENWIZ:
			text = GreenWiz_dia[DialoguePoint[GREENWIZ]]
		if Input.is_action_just_pressed("ui_accept"):
			DialoguePoint[GREENWIZ] += 1
			if DialoguePoint[GREENWIZ] >= GreenWiz_dia.size():
				DialoguePoint[GREENWIZ] = GreenWiz_dia.size() -1

func _on_UpgradeArea_body_exited(body):
	TalkingTo = NOONE
