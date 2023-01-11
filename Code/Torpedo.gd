class_name Torpedo
extends KinematicBody2D

signal torpedoDie
#velocity = calculate_velocity(get_local_mouse_position(), origin, speed, delta)
var torpedoIndicator = null
var velocity: Vector2 = Vector2.ZERO
var origin: Vector2 = self.get_position()
var target: Vector2
var hit: KinematicCollision2D
var loaded: bool = true

func _ready():
	print(get_children())

func _physics_process(_delta):
	hit = move_and_collide(velocity)
	if (hit and hit.collider.has_method("takeDamage")):
		hit.collider.takeDamage()
		self_destruct()
		
func  launch(_target: Vector2, _origin: Vector2, _speed: int, _delta):
	var _velocity = _target - _origin
	_velocity = _velocity.normalized()
	_velocity = _velocity * _speed * _delta
	velocity = _velocity
	return _velocity
	
func self_destruct():
	print("I SHOULD BE DEAAAAAAD", position)
	emit_signal("torpedoDie", self)
	pass


# Signals

func _on_VisibilityNotifier2D_screen_exited():
	self_destruct()
