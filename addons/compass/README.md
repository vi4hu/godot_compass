# Godot Compass

> :warning: This plugin is a work in progress

This plugin adds new Compass3D and Compass2D Nodes in Editor.

## Installation
1. Clone this repo or download as zip
2. Copy/Move the `res://addons/compass` directory to your `res://addons` directory

## Usage
1. Search and add Compass3D/Compass2D using Ctrl-A or Add Node button
2. Assign the Parent property for rotation calculation, **Parent** is the **rotating node**

Note: To use Compass2D for 2d games you need to provide the `parent_property_for_current_direction` property and set mode to `"2D"`, for example save your current direction in a var `dir` and type this in the property.

### Compass3D
| Property | Explaination | Default |
| --- | --- | --- |
| North | Sets the north direction (-180, 180) | `0.0` |
| parent | Rotating Node for calculation | None |
| Custom Container Resource | change container mesh | [container3d.mesh][l1] |
| Custom needle Resource | change needle mesh | [needle3d.mesh][l2] |

### Compass2D
| Property | Explaination | Default |
| --- | --- | --- |
| North | Sets the north direction (-180, 180)| `0.0` |
| Mode | condition, which North Vector type to use ("3D", "2D") | `"3D"` |
| parent | Rotating Node for calculation | None |
| parent_property_for_current_direction | parent property defining current direction (Mode 2D only) | `global_rotation` |
| Custom Container ImageTexture | change container png | [container2d.png][l3] |
| Custom needle ImageTexture | change needle png | [needle2d.png][l4] |

### Example
![media](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExYjMwYzFiY2UzZDRkYjAwMTIwOGJiN2FlZmM4M2IwMjgxM2Q1OWJiOCZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/Ok4Er4t1jwnU6POXm7/giphy.gif)

Check out the given `example.tscn` in [example][l0]
> use left/right arrow button to rotate camera

[l0]: ./addons/compass/example
[l1]: ./addons/compass/resources/container3d.mesh
[l2]: ./addons/compass/resources/needle3d.mesh
[l3]: ./addons/compass/resources/container2d.png
[l4]: ./addons/compass/resources/needle2d.png
