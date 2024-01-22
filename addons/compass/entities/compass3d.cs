using Godot;
using System;
using System.Text.RegularExpressions;

[Tool]
public partial class compass3d : Node3D
{
	[Export(PropertyHint.Range, "-180,180,")]
	public int North = 0;
	[Export(PropertyHint.Enum, "3D,2D")]
	public string Mode = "3D";
	[Export]
	public Node3D Parent;
	[Export]
	public Mesh CustomContainerResource
	{
		get => CustomContainerResource;
		set => CustomContainerResource = CustomContainerResourceChanged(value);
	}
	[Export]
	public Mesh CustomNeedleResource
	{
		get => CustomNeedleResource;
		set => CustomNeedleResource = CustomNeedleResourceChanged(value);
	}
	[Export(PropertyHint.Range, "0.01,0.5,")]
	public float LerpSpeed = 0.1f;
	[Export]
	public bool RotateContainer = false;

	private Mesh _containerRes = (Mesh)ResourceLoader.Load("res://addons/compass/resources/container3d.mesh");
	private Mesh _needleRes = (Mesh)ResourceLoader.Load("res://addons/compass/resources/needle3d.mesh");
	private MeshInstance3D _container;
	private MeshInstance3D _needle;
	private Tween _tween;
	// Called when the node enters the scene tree for the first time.

	private compass3d()
	{
		/// Set up the Compass2D Textures in editor/runtime
		Console.WriteLine(_containerRes);
		_container = new MeshInstance3D();
		_container.Name = "Container";
		_container.Mesh = _containerRes;
		//{
			//Name = "Container",
			//Mesh = _containerRes
		//};
		AddChild( _container, true );
		_needle = new MeshInstance3D();
		_needle.Name = "Needle";
		_needle.Mesh = _needleRes;
		//{
			//Name = "Needle",
			//Mesh = _needleRes
		//};
		AddChild( _needle, true );
	}
	public override void _Ready()
	{
		if ( Parent != null )
		{
			Console.WriteLine("WARNING: Parent(export property) is not set, Compass3D will not work.");
			this.SetPhysicsProcess(false);
		}
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		Console.WriteLine("Y");
		if ( Parent != null )
		{
			if ( Parent.GlobalRotation is Vector3 )
			{
				SetPhysicsProcess(false);
				Console.WriteLine("WARNING: Parent Property for rotation doesn't have valid type, requires Vector3.");
				return;
			}
			float NewRot = Parent.GlobalPosition.Y - Mathf.DegToRad(North);
			if ( RotateContainer )
			{
				if ( new Vector3(0, -NewRot, 0) != _container.Rotation )
				{
					_container.Rotation = new Vector3(
						_container.Rotation.X,
						Mathf.LerpAngle(_container.Rotation.Y, -NewRot, LerpSpeed),
						_container.Rotation.Z
					);

				}

			}
			else
			{
				if ( new Vector3(0, -NewRot, 0) != _container.Rotation )
				{
					_needle.Rotation = new Vector3(
						_container.Rotation.X,
						Mathf.LerpAngle(_needle.Rotation.Y, -NewRot, LerpSpeed),
						_container.Rotation.Z
					);

				}
			}
		}
	}

	private Mesh CustomContainerResourceChanged(Mesh value)
	{
		/// <summary>
		/// Sets custom png for Compass2D container
		/// </summary>
		this._container.Mesh = value;
		return value;
	}

	private Mesh CustomNeedleResourceChanged(Mesh value)
	{
		/// <summary>
		/// Sets custom png for Compass2D needle
		/// </summary>
		this._needle.Mesh = value;
		return value;
	}
}
