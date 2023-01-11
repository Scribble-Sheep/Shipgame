class_name BaseTarget
extends KinematicBody2D

#Transforms
var angle=0
var radius = 60
#Speeds
var rotSpeed = 2
var closingSpeed = 2
#Other
var health: int = 3

func _ready():
	position = polar2cartesian(radius, angle)
	pass

func _process(delta):
	move(delta, self.angle, self.rotSpeed, self.radius, self.closingSpeed)
	_updatePolarCoordinates()

func _updatePolarCoordinates():
	var polarCoords = cartesian2polar(position.x, position.y)
	radius=polarCoords.x
	angle=polarCoords.y

func move(_delta, _angle, _rotspeed, _radius, _closingspeed):
	print (self.name, " movement behavior not defined.")
	pass
	
func takeDamage():
	print(self.name, " hit, damage behavior not defined.")
	pass
