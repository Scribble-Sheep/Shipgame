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
		add_child(_torpedo)
