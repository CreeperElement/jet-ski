extends Area

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Area_body_entered(body):
	print("Body entered!")
	print("Body name: " + body.name)
