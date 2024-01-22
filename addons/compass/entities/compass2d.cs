using Godot;
using System;
using System.Text.RegularExpressions;

[Tool]
public partial class compass2d : Node2D
{
	[Export(PropertyHint.Range, "-180,180,")]
	public int North = 0;
	[Export(PropertyHint.Enum, "3D,2D")]
	public string Mode = "3D";
	[Export]
	public Node2D Parent;
	[Export]
	public string ParentPropertyForCurrentDirection = "global_rotation";
	[Export]
	public ImageTexture CustomContainerResource
	{
		get => CustomContainerResource;
		set => CustomContainerResource = CustomContainerResourceChanged(value);
	}
	[Export]
	public ImageTexture CustomNeedleResource
	{
		get => CustomNeedleResource;
		set => CustomNeedleResource = CustomNeedleResourceChanged(value);
	}
	[Export(PropertyHint.Range, "0.01,0.5,")]
	public float LerpSpeed = 0.1f;
	[Export]
	public bool RotateContainer = false;

	private Texture2D _containerRes = (Texture2D)ResourceLoader.Load("res://addons/compass/resources/container2d.png");
	private Texture2D _needleRes = (Texture2D)ResourceLoader.Load("res://addons/compass/resources/needle2d.png");
	private Sprite2D _container;
	private Sprite2D _needle;
	private Tween _tween;
	// Called when the node enters the scene tree for the first time.

	private compass2d()
	{
		/// Set up the Compass2D Textures in editor/runtime
		_container = new Sprite2D
		{
			Name = "Container",
			Texture = _containerRes
		};
		AddChild( _container, true );
		_needle = new Sprite2D
		{
			Name = "Needle",
			Texture = _needleRes
		};
		AddChild( _needle, true );
		
	}
	public override void _Ready()
	{
		if ( Parent != null )
		{
			Console.WriteLine("WARNING: Parent(export property) is not set, Compass2D will not work.");
			this.SetPhysicsProcess(false);
		}
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if ( Parent != null )
		{
			switch (Mode)
			{
				case "3D":
					if ( Parent.GlobalRotation is Vector3 )
					{
						SetPhysicsProcess(false);
						Console.WriteLine("WARNING: Parent Property for rotation doesn't have valid type, requires Vector3 for mode 3D.");
						return;
					}
				
					float NewRot = -Parent.GlobalPosition.Y + Mathf.DegToRad(North);
					if ( RotateContainer )
					{
						if ( NewRot != _container.Rotation )
						{
							_container.Rotation = Mathf.LerpAngle(_container.Rotation, NewRot, LerpSpeed);

						}

					}
					else
					{
						if ( NewRot != _container.Rotation )
						{
							_needle.Rotation = Mathf.LerpAngle(_needle.Rotation, NewRot, LerpSpeed);

						}
					}
					break;
				case "2D":
					Variant ParRot = Parent.Get(ParentPropertyForCurrentDirection);
					if ( ParRot is float || ParRot.Equals(null) )
					{
						SetPhysicsProcess(false);
						Console.WriteLine("WARNING: Parent Property for current direction doesn't have valid type, requires float for mode 2D.");
						return;
					}
					NewRot = -(float)ParRot + Mathf.DegToRad(North);
					if ( RotateContainer )
					{
						if ( NewRot != _container.Rotation )
						{
							_container.Rotation = Mathf.LerpAngle(_container.Rotation, -NewRot, LerpSpeed);

						}

					}
					else
					{
						if ( NewRot != _container.Rotation )
						{
							_needle.Rotation = Mathf.LerpAngle(_needle.Rotation, -NewRot, LerpSpeed);

						}
					}
					break;
			}
		}
	}

	private ImageTexture CustomContainerResourceChanged(ImageTexture value)
	{
		/// <summary>
		/// Sets custom png for Compass2D container
		/// </summary>
		this._container.Texture = value;
		return value;
	}

	private ImageTexture CustomNeedleResourceChanged(ImageTexture value)
	{
		/// <summary>
		/// Sets custom png for Compass2D needle
		/// </summary>
		this._needle.Texture = value;
		return value;
	}
}
