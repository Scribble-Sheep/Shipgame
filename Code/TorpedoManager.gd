class_name TorpedoManager
extends Node2D

onready var Indicators = get_tree().get_nodes_in_group("TorpedoIndicators")
const torpedoScene = preload("res://Scenes/Torpedo.tscn")
var torpedos = []
export var speed: int = 20

func _ready():
	if (Indicators.size() != 3):
		print ("something's wrong, we don't have 3 torpedo indicators.")
	torpedos.resize(Indicators.size())
	var _torpedo = null
	print (Indicators)
	for i in Indicators.size():
		_torpedo = torpedoScene.instance()
		_torpedo.torpedoIndicator = Indicators[i]
		torpedos[i] = _torpedo
		_torpedo.connect("torpedoDie", self, "haha")
		
		
func _process(delta):
	if (Input.is_action_just_pressed("fire")):
		_attemptFire(torpedos, delta)
		
	
func _attemptFire(_torpedos, delta):
	var Index = findValidTorpedo(_torpedos)
	print(Index)
	if(Index == null):
		return false
	else:
		add_child(_torpedos[Index])
		_torpedos[Index].launch(get_local_mouse_position(), get_position(), speed, delta)
	
func haha(instance):
	print ("haha you died, ", instance)

func findValidTorpedo(torpedoArray):
	#find torpedo that's not in scene and is loaded.
	for i in torpedoArray.size():
		if (torpedoArray[i].is_inside_tree() == false and torpedoArray[i].loaded):
			return i
	return null
