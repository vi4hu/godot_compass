extends Node3D

@onready var niddle:MeshInstance3D = $Niddle
@export var north:Vector3 = Vector3.FORWARD
@export var parent:Node


func _physics_process(delta) -> void:
	var new_rot:float = parent.rotation.y - north.y
	niddle.set_rotation(Vector3(0, -new_rot, 0))
