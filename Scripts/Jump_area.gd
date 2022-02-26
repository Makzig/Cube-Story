extends Area2D






func _on_Jump_area_body_entered(body):
	if body.is_in_group("Player"): #or body.is_in_group("Case"):
		body.Jump(1.5)
		$AnimationPlayer.play("Jump")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Jump":
		$AnimationPlayer.play("Idle")
