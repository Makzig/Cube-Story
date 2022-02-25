extends Area2D


signal Pressed

signal Realsead

func _on_Pressed_button_body_entered(body):
	if body.is_in_group("Player") or body.is_in_group("Case"):
		emit_signal("Pressed")


func _on_Pressed_button_body_exited(body):
	if body.is_in_group("Player") or body.is_in_group("Case"):
		emit_signal("Realsead")
