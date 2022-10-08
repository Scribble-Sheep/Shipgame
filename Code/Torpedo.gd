extends KinematicBody2D

export var speed: int = 20

var velocity: Vector2 = Vector2.ZERO
var origin: Vector2 = self.get_position()
var target: Vector2
var hit: KinematicCollision2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (Input.is_action_just_pressed("fire")):
		velocity = calculate_velocity(get_local_mouse_position(), origin, speed, delta)
	hit = move_and_collide(velocity)
	if (hit):
		print ("Bitch get out of my way, ", hit.collider.name)
		
func  calculate_velocity(_target: Vector2, _origin: Vector2, _speed: int, _delta):
	var _velocity = _target - _origin
	_velocity = _velocity.normalized()
	_velocity = _velocity * _speed * _delta
	return _velocity