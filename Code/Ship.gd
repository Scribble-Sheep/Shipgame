class_name Ship
extends Area2D



#func _on_Ship_input_event(viewport, event, shape_idx):
	#if (event is InputEventMouseButton && event.pressed):


func _on_Ship_mouse_entered():
	pass


func _on_Ship_mouse_exited():
	pass


func _on_Ship_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		pass
