extends Area2D






func _on_Jump_area_body_entered(body):
	if body.is_in_group("Player"):
		body.Jump(1.5)
