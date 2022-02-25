extends Area2D



func _on_Timer_timeout():
	$StaticBody2D/CollisionShape2D2.disabled = false




func _on_Platform_test_body_entered(body):
	if body.is_in_group("Player"):
		$StaticBody2D.set("colision_layer")
		$Timer.start()
		print("Entered")
