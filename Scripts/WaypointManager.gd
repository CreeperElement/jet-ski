extends Node

var waypoints = {}
signal illegal_waypoint_traversal(last_waypoint)
signal player_finished(player)

func _ready():
	connect("_waypoint_entered", self, "_handle_waypoint_entered")

func _handle_waypoint_entered(player, new_waypoint):
	var player_name = player.get_player_name()
	if !waypoints.has(player_name):
		waypoints[player_name] = new_waypoint
		connect("illegal_waypoint_traversal", player, "_handle_illegal_waypoint_traversal")
		connect("player_finished", player, "_handle_player_finished")
		return

	var last_waypoint = waypoints[player_name]
	if !last_waypoint.has_valid_child(new_waypoint):
		emit_signal("illegal_waypoint_traversal", last_waypoint)
	else:
		waypoints[player_name] = new_waypoint
		if waypoints[player_name].get_child_count() <= 0:
			emit_signal("player_finished")
