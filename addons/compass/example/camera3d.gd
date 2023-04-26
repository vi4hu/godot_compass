# Usage
# use left/right arraw to rotate camera
extends Camera3D


func _process(delta):
	if Input.is_action_pressed("ui_right"):
		rotate_y(-delta)
	if Input.is_action_pressed("ui_left"):
		rotate_y(delta)
