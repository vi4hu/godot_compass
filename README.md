# Godot Compass :compass:

**Compass** implementation for different needs in **Godot Engine**, written in **GDScript**.

This project is a Godot Engine addon that adds new **CompassBar**, **Compass3D**, and **Compass2D** Nodes in Editor. These new nodes make easy and fast **Compass** creation possible for 3D and 2D games. It is available under the terms of the **MIT** License.


## Installation
#### Method One:
1.  Search "Godot Compass" in the AssetLib
2.  Download and Install
#### Method Two:
1. Clone this repo or download as zip from matching branch
2. Copy/Move the `res://addons/compass` directory to your `res://addons` directory

## Usage
1. Search and add CompassBar/Compass3D/Compass2D using Ctrl-A or Add Node button
2. Assign the Parent property for rotation calculation, **Parent** is the **rotating node**

Note: To use CompassBar and Compass2D for 2d games, if you are not rotating the node, provide the `parent_property_for_current_direction`, for example save your current direction in a var `dir` and type this in the property.

### CompassBar

Property | Explanation | Default |
| --- | --- | --- |
| Parent | Rotating Node for calculation | None |
| Mode | condition, which North Vector type to use ["3D", "2D"] | `"3D"` |
| Parent Property For Current Direction | parent property defining current direction (Mode 2D only) | `rotation` |
| Lerp Speed | Smoothing (0.01, 0.5) | `0.1` |

| Shader Property | Explanation | Default |
| --- | --- | --- |
| North | North offset in radians (0, 2*PI) | `0.0` (-Y for 2D, -Z for 3D) |

### Compass3D

| Property | Explanation | Default |
| --- | --- | --- |
| North | Sets the north direction (-180, 180) | `0` (-Z)|
| Parent | Rotating Node for calculation | None |
| Custom Container Resource | change container mesh | [container3d.mesh][l1] |
| Custom needle Resource | change needle mesh | [needle3d.mesh][l2] |
| Lerp Speed | Smoothing (0.01, 0.5) | `0.1` |
| Rotate Container | Check to Rotates Container instead of Needle | `false` |

### Compass2D

| Property | Explanation | Default |
| --- | --- | --- |
| North | Sets the north direction (-180, 180)| `0` (-Y for 2D, -Z for 3D) |
| Mode | condition, which North Vector type to use ["3D", "2D"] | `"3D"` |
| Parent | Rotating Node for calculation | None |
| Parent Property For Current Direction | parent property defining current direction (Mode 2D only) | `global_rotation` |
| Custom Container ImageTexture | change container png | [container2d.png][l3] |
| Custom needle ImageTexture | change needle png | [needle2d.png][l4] |
| Lerp Speed | Smoothing (0.01, 0.5) | `0.1` |
| Rotate Container | Check to rotates Container instead of Needle | `false` |

### Example
![media](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZjgyNzBjNTM2M2ZjYzRjZDc3ZDIwNTRmYTQ4NDYzYjUwNjJjNGEzZCZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/bvR3MilNYVsjbbTb7x/giphy.gif)

Check out the given `example.tscn` for 3d games and `example2d.tscn` for 2d games in [example][l0].
> use left/right arrow button to rotate camera for 3d example

> use Q(left) and R(right) for 2d example

[l0]: ./addons/compass/example
[l1]: ./addons/compass/resources/container3d.mesh
[l2]: ./addons/compass/resources/needle3d.mesh
[l3]: ./addons/compass/resources/container2d.png
[l4]: ./addons/compass/resources/needle2d.png
