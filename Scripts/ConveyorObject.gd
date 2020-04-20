extends KinematicBody

var Gravity = Vector3(0, -9, 0)
var MAX_FALL = 10

onready var velocity: Vector3

func _ready():
	velocity = Vector3(0, 0, 0)

func get_name():
	return "pushable"

func _physics_process(delta):
	velocity += Gravity*delta
	if velocity.y >= MAX_FALL:
		velocity.y = MAX_FALL
	velocity = move_and_slide(velocity)
