@tool
extends Node3D

@export_range(0, 360) var north: int = 0
@export var parent: Node
@export var custom_container_resource : ArrayMesh :
	set (value):
		custom_container_resource = custom_container_resource_changed(value)
@export var custom_needle_resource : ArrayMesh :
	set (value):
		custom_needle_resource = custom_needle_resource_changed(value)

var container_res = load("res://addons/compass/resources/container3d.mesh")
var needle_res = load("res://addons/compass/resources/needle3d.mesh")
var container: MeshInstance3D
var needle: MeshInstance3D
var _tween: Tween


func _init() -> void:
	"""Set up the Compass3D meshes in editor/runtime"""
	container = MeshInstance3D.new()
	container.name = "Container"
	container.mesh = container_res
	add_child(container, true)
	needle = MeshInstance3D.new()
	needle.name = "needle"
	needle.mesh = needle_res
	add_child(needle, true)


func _ready() -> void:
	# to debug:
	if not parent:
		print("WARNING: Parent(export property) is not set, Compass3D will not work.")
		set_physics_process(false)


func _physics_process(delta) -> void:
	if parent:
		var new_rot:float = parent.global_rotation.y - deg_to_rad(north)
		if Vector3(0, -new_rot, 0) != needle.get_rotation():
			needle.set_rotation(Vector3(0, -new_rot, 0))


func custom_container_resource_changed(value: ArrayMesh) -> ArrayMesh:
	"""Sets custom mesh for Compass3D container"""
	container.mesh = value
	return value


func custom_needle_resource_changed(value: ArrayMesh) -> ArrayMesh:
	"""Sets custom mesh for Compass3D needle"""
	needle.mesh = value
	return value
