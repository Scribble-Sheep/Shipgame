extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 20

var direction: int = 0
var velocity: Vector2 = Vector2.ZERO

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if (Input.is_action_just_pressed("ui_accept")):
		rng.randomize()
		velocity.x = rng.randf_range(-160,160)
		velocity.y = rng.randf_range(-60,60)
		velocity = velocity.normalized()
	
	move_and_collide(velocity * speed * delta)
