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
var oldPos = Vector2.ZERO#debug code

func _ready():
	position = polar2cartesian(radius, angle)
	oldPos = position#debug code
	pass

func _process(delta):
	move(delta, self.angle, self.rotSpeed, self.radius, self.closingSpeed)
	_updatePolarCoordinates()
	_debugUpdateLabel()
	oldPos = position #debug code

func _updatePolarCoordinates():
	var polarCoords = cartesian2polar(position.x, position.y)
	radius=polarCoords.x
	angle=polarCoords.y
	
func _debugUpdateLabel():#debug code
	var debugLabels = get_tree().get_nodes_in_group("Debug Labels")
	debugLabels[0].text ="Sped: " + str((position - oldPos).length()) + "\n"
	debugLabels[0].text +="RSped: " + str(rotSpeed) + "\n"
	debugLabels[0].text +="Type: " + name + "\n"
	debugLabels[0].text +="Health: " + str(health)
	
# Instance defined methods becaus gdscript doesn't allow abstraction
func move(_delta, _angle, _rotspeed, _radius, _closingspeed):
	print (self.name, " movement behavior not defined.")
	pass
	
func takeDamage():
	print(self.name, " hit, damage behavior not defined.")
	pass
