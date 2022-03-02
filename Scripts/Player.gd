extends KinematicBody2D

var count_jump = 1
const SPEED = 100.0
var Move = Vector2()

var Lives = true

const GRAVITY = 650
const JUMP_FORCE = 200

#Для анимаций
onready var Anim_tree = $AnimationTree
onready var Anim_playback = $AnimationTree.get("parameters/playback")


#Переменная для эффекта кайота
var Kayot_time = false

var Finish = false







#Обычный прыжок(для батута и сферы)
func Jump(Force):
	Move.y = -JUMP_FORCE * Force
	Anim_playback.travel("Jump")
	if count_jump < 1.4:
		count_jump +=0.1



#При нажатии кнопки прыжка
func Jump_Input(delta):
	if Lives == true:
		if Input.is_action_just_pressed("Jump") and  is_on_floor(): #Kayot_floor == true:
			Jump(1)
		
		#Что бы не упирался в потолок при прыжке
		elif is_on_ceiling():
			Gravition(delta)
			Anim_playback.travel("Fall")




func Moving():
	#При наличии жизни есть движение , а движение - это жизнь
	if Lives == true and Finish == false:
		if Input.is_action_pressed("Left"):
			Move.x = -SPEED
			Anim_playback.travel("Walk")
			$Sprite.flip_h = true
			
			
		elif Input.is_action_pressed("Right"):
			Move.x = SPEED
			Anim_playback.travel("Walk")
			$Sprite.flip_h = false
			
		
		else:
			Move.x = 0
			Anim_playback.travel("Idle")
			
		if Input.is_action_pressed("Left") and Input.is_action_pressed("Right"):
			Move.x = 0
			Anim_playback.travel("Idle")
			
	#
	elif Lives == false:
		Kill()




func _process(delta):
	Moving()
	Jump_Input(delta)
	
	
	
	if !is_on_floor() and Finish == false:
		Gravition(delta)
	if is_on_floor():
		count_jump = 1

# warning-ignore:return_value_discarded
	move_and_slide(Move, Vector2.UP )





func _on_Hit_box_area_entered(area):
	#Если попадает в препятсвие
	if area.is_in_group("Enemy") or area.is_in_group("Blocks"):
		Kill()
		#if is_on_floor():
		$Die_Timer.start()
		
	#Если попадает в финиш, становится бездвижным
	if area.is_in_group("Finish"):
		Move = Vector2(0, 0)
		Anim_playback.travel("Finish")
		Finish = true
		


func Kill():
	Anim_playback.travel("Die")
	Move.x = 0
	Lives = false


#Отельно Гравитация
func Gravition(delta):
	Move.y += (GRAVITY * delta)
	Anim_playback.travel("Fall")


#и отдельно рестарт
func Reload():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	Lives = true




func _on_Die_Timer_timeout():
	Reload()
