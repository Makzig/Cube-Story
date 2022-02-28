extends StaticBody2D


var Pressed = false


func _process(_delta):
	if Pressed == false:
		$AnimationPlayer.play("Idle")
	elif Pressed == true:
		$AnimationPlayer.play("Pressed")
	$CollisionShape2D.disabled = Pressed
