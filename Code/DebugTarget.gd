class_name DebugTarget
extends BaseTarget

#Automatically called by the parent _process	
func move(_delta, _angle, _rotspeed, _radius, _closingspeed):
	_angle+=_rotspeed*_delta
	_radius-=_closingspeed*_delta
	position=polar2cartesian(_radius, _angle)
