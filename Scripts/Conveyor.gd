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
	var velocity = body.velocity
	velocity = Vector3(body.velocity.x, 0, body.velocity.z)
	body.velocity = velocity
	bodies.remove(bodies.find(body))

func _physics_process(delta):
	for body in bodies:
		set_velocity(body)

func set_velocity(body):
	var new_velocity = body.velocity
	var localBasis = self.get_global_transform().basis.z
	new_velocity = Vector3(localBasis.x, -1, localBasis.z)
	body.velocity = new_velocity
