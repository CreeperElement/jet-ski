extends KinematicBody

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var targetDirection = Vector3(0, 0, 1) * delta
	transform.origin += targetDirection

func printMessage():
	print("This is a message")
