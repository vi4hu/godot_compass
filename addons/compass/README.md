# Godot Compass

> :warning: This plugin is work in progress

This plugin adds new Compass3D and Compass2D Nodes.

## Installation
1. Clone this repo or download as zip
2. Copy/Move the `res://addons/compass` directory to your `res://addons` directory

## Usage
1. Search and add Compass3D/Compass2D using Ctrl-A or Add Node button
2. Assign the Parent property for rotation calculation, **Parent** is the **rotating node**

### Compass3D
| Property | Explaination | Default |
| --- | --- | --- |
| North | Sets the north direction (-180, 180) | `0` |
| parent | Rotating Node for calculation | None |
| Custom Container Resource | change container mesh | [container3d.mesh][l1] |
| Custom Niddle Resource | change niddle mesh | [niddle3d.mesh][l2] |

### Compass2D
| Property | Explaination | Default |
| --- | --- | --- |
| North | Sets the north direction (-180, 180)| `0` |
| Mode | condition, which North Vector type to use ("3D", "2D") | `"3D"` |
| parent | Rotating Node for calculation | None |
| parent_property_for_current_direction | parent property defining current direction (Mode 2D only) | `global_direction` |
| Custom Container ImageTexture | change container png | [container2d.png][l3] |
| Custom Niddle ImageTexture | change niddle png | [niddle2d.png][l4] |

### Example
Check out the given `example.tscn` in [example][l0]
> use left/right arrow button to rotate camera

[l0]: ./addons/compass/example
[l1]: ./addons/compass/resources/container3d.mesh
[l2]: ./addons/compass/resources/niddle3d.mesh
[l3]: ./addons/compass/resources/container2d.png
[l4]: ./addons/compass/resources/niddle2d.png
