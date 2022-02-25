extends KinematicBody2D


var Move = Vector2()

const GRAVITY = 900
const JUMP_FORCE = 500

var Speed = 150




func Gravition(delta):
	if !is_on_floor():
		Move.y += GRAVITY * delta

func _physics_process(delta):
	
	
	
	Gravition(delta)
# warning-ignore:return_value_discarded
	move_and_slide(Move, Vector2.UP)



func _on_Left_body_entered(body):
	if body.is_in_group("Player"):
		Move.x = Speed



func _on_Right_body_entered(body):
	if body.is_in_group("Player"):
		Move.x = -Speed


func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		Move.x = 0



func Jump(Force):
	Move.y = -JUMP_FORCE * Force
