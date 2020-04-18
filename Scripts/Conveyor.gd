extends Spatial

var bodies = []

func _ready():
	$PushArea.connect("body_entered", self, "_on_push_entered")
	$PushArea.connect("body_exited", self, "_on_push_exited")

func _on_push_entered(body):
	if body.get_name() != "pushable":
		return
	bodies.append(body)

func _on_push_exited(body):
	if body.get_name() != "pushable":
		return
	bodies.remove(bodies.find(body))

func _physics_process(delta):
	for body in bodies:
		set_velocity(body)

func set_velocity(body):
	var new_velocity = body.velocity
	var localBasis = transform.basis.z
	new_velocity = Vector3(localBasis.x, -1, localBasis.z)
	new_velocity += center(body)
	body.velocity = new_velocity

func center(body):
	var body_pos = body.get_transform().origin
	var center_pos = get_transform().origin
	
	var difference = center_pos - body_pos
	difference = difference * get_global_transform().basis.x
	print(get_global_transform().basis.x)
	return difference*2
	
