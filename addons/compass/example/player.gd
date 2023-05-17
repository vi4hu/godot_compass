extends CharacterBody2D

const SPEED = 300.0


func _input(event):
	# press q or e to rotate
	if event is InputEventKey and event.unicode == KEY_Q + 32:
		global_rotation += rad_to_deg(PI/10)
	if event is InputEventKey and event.unicode == KEY_E + 32:
		global_rotation -= rad_to_deg(PI/10)
