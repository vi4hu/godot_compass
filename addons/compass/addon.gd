@tool
extends EditorPlugin

var icon = preload("res://addons/compass/icon.png")
var compass2d = preload("res://addons/compass/entities/compass2d.gd")
var compass3d = preload("res://addons/compass/entities/compass3d.gd")
var compassbar = preload("res://addons/compass/entities/compassbar.gd")


func _enter_tree():
	add_custom_type("Compass2D", "Node2D", compass2d, icon)
	add_custom_type("Compass3D", "Node3D", compass3d, icon)
	add_custom_type("CompassBar", "TextureRect", compassbar, icon)


func _exit_tree():
	remove_custom_type("Compass3D")
	remove_custom_type("Compass2D")
	remove_custom_type("CompassBar")
