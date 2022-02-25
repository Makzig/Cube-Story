extends StaticBody2D


var Pressed = false


func _process(_delta):
	$Sprite.visible = !Pressed
	$CollisionShape2D.disabled = Pressed
