class_name BaseTarget
extends KinematicBody2D

var angle=0
var rotspeed = 1
var radius = 60
var closingSpeed = 5

func _ready():
	position = polar2cartesian(radius, angle)
	pass

func _process(delta):
	move(delta, self.angle, self.rotspeed, self.radius, self.closingSpeed)
	_updatePolarCoordinates()

func _updatePolarCoordinates():
	var polarCoords = cartesian2polar(position.x, position.y)
	radius=polarCoords.x
	angle=polarCoords.y

func move(delta, _angle, _rotspeed, _radius, _closingspeed):
	print (self.name, " movement behavior not defined.")
	pass
	
func takeDamage():
	print(self.name, " hit, damage behavior not defined.")
	pass
