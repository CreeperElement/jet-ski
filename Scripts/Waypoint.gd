extends Area

export(Array, String) var Edges
var children = []
signal _waypoint_entered

# Called when the node enters the scene tree for the first time.
func _ready():
	var waypoint_node = get_parent()
	connect("body_entered", self, "_on_body_entered")
	connect("_waypoint_entered", waypoint_node, "_handle_waypoint_entered")
	for node_name in Edges:
		children.append(waypoint_node.get_node(node_name))

func _on_body_entered(body):
	if(body.get_name()=="ski-body"):
		emit_signal("_waypoint_entered", body, self)

func has_valid_child(waypoint):
	for child in children:
		if(waypoint.name == child.name):
			return true
	# Happens when we drop player back on the node to get back in bounds
	if waypoint.name == name:
		return true
	return false
