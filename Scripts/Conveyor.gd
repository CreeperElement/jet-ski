extends Spatial

var bodies = []

func _ready():
	pass
	connect("body_entered", self, "_on_push_entered")

func _on_push_entered(body):
	if body.get_name() != "pushable":
		return
	bodies.append(body)

func _physics_process(delta):
	for body in bodies:
		body.RigidBody.set_linear_velocity(self.get_global_transform.basis.z)
