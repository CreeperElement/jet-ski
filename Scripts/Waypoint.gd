extends Area

export(Array, String) var Edges
var children = []

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_body_entered")
	var waypoint_node = get_tree().get_root().get_node("Spatial/Waypoints")
	for node_name in Edges:
		children.append(waypoint_node.get_node(node_name))
	print("Node " + name + ": has " + String(children.size()) + " children.")

func _on_body_entered(body):
	if(body.get_name()=="ski-body"):
		body.process_next_node(self)

func has_valid_child(waypoint):
	for child in children:
		if(waypoint.name == child.name):
			return true
	# Happens when we drop player back on the node to get back in bounds
	if waypoint.name == name:
		return true
	return false
