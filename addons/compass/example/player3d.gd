"""
Basic FPS Controller
Credits: https://kidscancode.org/godot_recipes/4.x/3d/basic_fps/
"""
extends CharacterBody3D

@onready var Camera = get_node("Camera3D")

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var speed = 5
var jump_speed = 5
var mouse_sensitivity = 0.002


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta):
	velocity.y += -gravity * delta
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = movement_dir.x * speed
	velocity.z = movement_dir.z * speed

	move_and_slide()
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_speed


func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		Camera.rotate_x(-event.relative.y * mouse_sensitivity)
		Camera.rotation.x = clampf(Camera.rotation.x, -deg_to_rad(70), deg_to_rad(70))
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
