class_name DebugTarget
extends BaseTarget

var d: float = 0

export var radius: float = 60
export var speed: float = 2.0

func _process(delta):
	d += delta
	position = Vector2(sin(d * speed) * radius,cos(d*speed) * radius)
	radius -= 1 *delta

