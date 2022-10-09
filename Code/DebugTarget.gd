extends KinematicBody2D

var d: float = 0

export var radius: float = 60
export var speed: float = 2.0

func _process(delta):
	d += delta
	position = Vector2(sin(d * speed) * radius,cos(d*speed) * radius)
	#radius -= 1 *delta
	
func change_speed():
	pass
	
func change_distance():
	pass
