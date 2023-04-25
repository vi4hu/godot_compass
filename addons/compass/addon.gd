@tool
extends EditorPlugin

var icon = preload("res://addons/compass/icon.png")
var compass3d = preload("res://addons/compass/entities/compass3d.gd")

func _enter_tree():
	add_custom_type("Compass3D", "Node3D", compass3d, icon)
	pass


func _exit_tree():
	remove_custom_type("Compass3D")
	pass
