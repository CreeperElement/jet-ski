extends KinematicBody

onready var current_node

var velocity = Vector3.ZERO
var Terminal_Velocity = 200

func _ready():
	connect("illegal_waypoint_traversal", self, "_handle_illegal_waypoint_traversal")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = fall()
	move_and_slide(velocity * delta)

func _handle_illegal_waypoint_traversal(last_waypoint):
	print("Illegal Waypoint")
	pass

func _handle_player_finished():
	print("Player Finished")
	pass

func fall():
	velocity = velocity + (Vector3.DOWN * 9.81)
	if(velocity.length() >= Terminal_Velocity):
		velocity = velocity.normalized() * Terminal_Velocity
	return velocity

func get_player_name():
	return "player1"
