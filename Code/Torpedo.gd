extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 20

var direction: int = 0
var velocity: Vector2 = Vector2.RIGHT

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	velocity.x = rng.randf_range(-160,160)
	velocity.y = rng.randf_range(-60,60)
	velocity = velocity.normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_collide(velocity * speed * delta)
