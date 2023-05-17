@tool
extends Node2D

@export_range(-180, 180) var north: int = 0
@export_enum("3D", "2D") var mode: String = "3D"
@export var parent:Node
@export var parent_property_for_current_direction: String = "global_rotation"
@export var custom_container_resource : ImageTexture :
	set (value):
		custom_container_resource = custom_container_resource_changed(value)
@export var custom_needle_resource : ImageTexture :
	set (value):
		custom_needle_resource = custom_needle_resource_changed(value)
@export_range(0.01, 0.5) var _lerp_speed: float = 0.1

var container_res = load("res://addons/compass/resources/container2d.png")
var needle_res = load("res://addons/compass/resources/needle2d.png")
var container: Sprite2D
var needle: Sprite2D
var _tween: Tween


func _init() -> void:
	"""Set up the Compass2D Textures in editor/runtime"""
	container = Sprite2D.new()
	container.name = "Container"
	container.texture = container_res
	add_child(container, true)
	needle = Sprite2D.new()
	needle.name = "needle"
	needle.texture = needle_res
	add_child(needle, true)


func _ready() -> void:
	if not parent:
		print("WARNING: Parent(export property) is not set, Compass2D will not work.")
		set_physics_process(false)


func _physics_process(delta) -> void:
	if parent:
		match mode:
			"3D":
				if not parent.global_rotation is Vector3:
					set_physics_process(false)
					print("WARNING: Parent Property for rotation doesn't have valid type, requires Vector3 for mode 3D.")
					return
			
				var new_rot: float = parent.global_rotation.y - deg_to_rad(north)
				if new_rot != needle.get_rotation():
					needle.rotation = lerp_angle(needle.rotation, new_rot, _lerp_speed)
			"2D":
				if not parent.get(parent_property_for_current_direction) is float:
					set_physics_process(false)
					print("WARNING: Parent Property for current direction doesn't have valid type, requires float for mode 2D.")
					return
				
				var new_rot: float = -parent.get(parent_property_for_current_direction) + deg_to_rad(north)
				if new_rot != needle.get_rotation():
					needle.rotation = lerp_angle(needle.rotation, -new_rot, _lerp_speed)


func custom_container_resource_changed(value: ImageTexture) -> ImageTexture:
	"""Sets custom png for Compass2D container"""
	container.set_texture(value)
	return value


func custom_needle_resource_changed(value: ImageTexture) -> ImageTexture:
	"""Sets custom png for Compass2D needle"""
	needle.set_texture(value)
	return value
