# Usage
# use left/right arraw to rotate camera
extends Camera3D

var speed: int = 3

#func _ready():
#	$"../CenterContainer/TextureRect".material.set_shader_parameter(
#		"dir",
#		rotation.y
#	)

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		rotate_y(-delta * speed)
	if Input.is_action_pressed("ui_left"):
		rotate_y(delta * speed)
