extends KinematicBody

onready var current_node
var out_of_bounds = false
var velocity = Vector3.ZERO
var Terminal_Velocity = 200

func _ready():
	current_node = get_tree().get_root().get_node("Spatial/Waypoints/start")
	print(current_node.name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if out_of_bounds:
		print("Out of Bounds")
	velocity = velocity + (Vector3.DOWN * 9.81)
	if(velocity.length() >= Terminal_Velocity):
		velocity = velocity.normalized() * Terminal_Velocity
	move_and_slide(velocity * delta)

func printMessage():
	print("This is a message")

func process_next_node(next_node):
	if current_node.has_valid_child(next_node):
		current_node = next_node
	else:
		out_of_bounds = true
