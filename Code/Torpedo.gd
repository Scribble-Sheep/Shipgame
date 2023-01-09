class_name Torpedo
extends KinematicBody2D

export var speed: int = 20

var torpedoIndicator = null
var velocity: Vector2 = Vector2.ZERO
var origin: Vector2 = self.get_position()
var target: Vector2
var hit: KinematicCollision2D

func _ready():
	randomize()
	var sprtie = get_node("Sprite")
	sprtie.rotate(randi() % 360)
	print ("hehe")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (Input.is_action_just_pressed("fire")):
		velocity = calculate_velocity(get_local_mouse_position(), origin, speed, delta)
		
	hit = move_and_collide(velocity)
	if (hit and hit.collider.has_method("takeDamage")):
		hit.collider.takeDamage()
		self_destruct()
		
func  calculate_velocity(_target: Vector2, _origin: Vector2, _speed: int, _delta):
	var _velocity = _target - _origin
	_velocity = _velocity.normalized()
	_velocity = _velocity * _speed * _delta
	return _velocity
	
func self_destruct():
	print("I SHOULD BE DEAAAAAAD", position)
	pass


# Signals

func _on_VisibilityNotifier2D_screen_exited():
	self_destruct()
