@tool
extends Node3D

@export var north:Vector3 = Vector3.FORWARD
@export var parent:Node
@export var custom_container_resource : ArrayMesh :
	set (value):
		custom_container_resource = custom_container_resource_changed(value)
@export var custom_niddle_resource : ArrayMesh :
	set (value):
		custom_niddle_resource = custom_niddle_resource_changed(value)

var container_res = load("res://addons/compass/resources/container3d.mesh")
var niddle_res = load("res://addons/compass/resources/niddle3d.mesh")
var container: MeshInstance3D
var niddle: MeshInstance3D


func _init() -> void:
	"""Set up the Compass3D meshes in editor/runtime"""
	container = MeshInstance3D.new()
	container.name = "Container"
	container.mesh = container_res
	add_child(container, true)
	niddle = MeshInstance3D.new()
	niddle.name = "Niddle"
	niddle.mesh = niddle_res
	add_child(niddle, true)


func _ready() -> void:
	# to debug:
	if not parent:
		print("WARNING: Parent(export property) is not set, Compass3D will not work.")


func _physics_process(delta) -> void:
	if parent:
		var new_rot:float = parent.global_rotation.y - north.y
		niddle.set_rotation(Vector3(0, -new_rot, 0))


func custom_container_resource_changed(value: ArrayMesh) -> ArrayMesh:
	"""Sets custom mesh for Compass3D container"""
	container.mesh = value
	return value


func custom_niddle_resource_changed(value: ArrayMesh) -> ArrayMesh:
	"""Sets custom mesh for Compass3D niddle"""
	niddle.mesh = value
	return value
