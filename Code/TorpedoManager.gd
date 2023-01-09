class_name TorpedoManager
extends Node

onready var Indicators = get_tree().get_nodes_in_group("TorpedoIndicators")
const torpedoScene = preload("res://Scenes/Torpedo.tscn")
var torpedos = []

func _ready():
	print ("Bahahahaha")
	if (Indicators.size() != 3):
		print ("something's wrong, we don't have 3 torpedo indicators.")
	torpedos.resize(Indicators.size())
	print (Indicators)
	for i in Indicators.size():
		var _torpedo = torpedoScene.instance()
		_torpedo.torpedoIndicator = Indicators[i]
		_torpedo.connect("torpedoDie", self, "haha")
		
func _process(delta):
	if (Input.is_action_just_pressed("fire")):
		print("FIRE")
		
	
func haha(instance):
	print ("haha you died, ", instance)

func findValidTorpedo(torpedoArray):
	for torpedo in torpedoArray:
		pass #find torpedo that's not in scene and is loaded.

#if (Input.is_action_just_pressed("fire")):
	#velocity = calculate_velocity(get_local_mouse_position(), origin, speed, delta)
