extends StaticBody2D


var Pressed = false


func _process(_delta):
	if Pressed == true:
		$CollisionShape2D.disabled = true
		$Sprite.visible = true
		
	elif Pressed == true:
		$CollisionShape2D.disabled = false
		$Sprite.visible = false
