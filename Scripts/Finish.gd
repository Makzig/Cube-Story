extends Area2D



func _on_Finish_body_entered(body):
	if body.is_in_group("Player"):
		$Finish_scene.start()
		body.global_position = position




func _on_Finish_scene_timeout():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Location/Location_1-Forest/" + self.name + ".tscn")
