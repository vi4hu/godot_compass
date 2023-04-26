# Godot Compass

> :warning: This is plugin is work in progress

> :stop_sign: Compass2D Node is not availale at the time

This plugin adds new Compass3D(usable) and Compass2D(not available) Nodes.

## Installation
1. Clone this repo or download as zip
2. Copy the `res://addons/compass` directory to your `res://addons` directory

## Usage
1. Search and add Compass3D/compass2D using Ctrl-A or Add Node button
2. Assign the Parent property for rotation calculation, Parent is the rotating player node

### Compass3D
| Properties | Explaination | Default |
| --- | --- | --- |
| North | Sets the north direction | Vector3.FORWARD |
| parent | Rotating Node for calculation | None |
| Custom Container Resource | change container mesh | [container3d.mesh][l1] |
| Custom Niddle Resource | change niddle mesh | [niddle3d.mesh][l2] |

### Example
Check out the given `example.tscn` in [example](./addons/compass/example)
> use left/right arrow button to rotate camera

[l1]: ./addons/compass/resources/container3d.mesh
[l2]: ./addons/compass/resources/niddle3d.mesh
