@tool
extends TextureRect

@export var parent: Node
@export_range(0.01, 0.5) var _lerp_speed: float = 0.1

var default_bar_sprite = preload("res://addons/compass/resources/compassbar.png")
var mat = preload("res://addons/compass/resources/compassbar.material")
var _tween: Tween


func _init() -> void:
	"""Set up the CompassBar Textures in editor/runtime"""
	set_texture(default_bar_sprite)


func _ready() -> void:
	if not parent:
		print("WARNING: Parent(export property) is not set, CompassBar will not work.")
		set_physics_process(false)
	_setup()


func _setup() -> void:
	set_stretch_mode(TextureRect.STRETCH_KEEP_CENTERED)
	set_material(mat)
	set_texture_repeat(CanvasItem.TEXTURE_REPEAT_ENABLED)


func _physics_process(delta) -> void:
	if parent:
		if not parent.get("rotation") is Vector3:
			set_physics_process(false)
			print("WARNING: Parent 'rotation' Property doesn't have valid type, requires Vector3.")
			return
		var curr_val = material.get_shader_parameter("dir")
		material.set_shader_parameter(
			"dir", lerp_angle(curr_val, parent.rotation.y, _lerp_speed)
		)
