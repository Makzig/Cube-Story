extends KinematicBody2D


const SPEED = 200.0
var Move = Vector2()

const GRAVITY = 1300
const JUMP_FORCE = 500


#Переменная для эффекта кайота
#var Kayot_floor = false

#Обычный прыжок(для батута и сферы)
func Jump():
	Move.y = -JUMP_FORCE
	$AnimationPlayer.play("Jump")


#При нажатии кнопки прыжка
func Jump_Input():
	if Input.is_action_just_pressed("Jump") and  is_on_floor(): #Kayot_floor == true:
		Jump()




func Moving():
	if Input.is_action_pressed("Left"):
		Move.x = -SPEED
	elif Input.is_action_pressed("Right"):
		Move.x = SPEED
	else:
		Move.x = 0


func _process(delta):
	Moving()
	Jump_Input()
	
		
	if !is_on_floor():
		Move.y += (GRAVITY * delta)
# warning-ignore:return_value_discarded
	move_and_slide(Move, Vector2.UP )



