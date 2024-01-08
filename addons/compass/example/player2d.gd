extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("A", "D")
	direction.y = Input.get_axis("W", "S")
	if direction:
		velocity = direction.normalized() * SPEED
		rotation_degrees = rad_to_deg(velocity.angle()) + 90
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
