package;
import coreClasses.Core_GameObject;
import coreClasses.GameController;
import openfl.display.MovieClip;
import openfl.display.DisplayObject;
import openfl.Assets;

/**
 * ...
 * @author ...
 */
class BraggingRights extends GameController
{
	public var worldMap:MovieClip;
	public var camera:Core_GameObject;

	public function new() 
	{
		super();
		this.buildLevel(Assets.getMovieClip("coreAssets:Ast_WorldMap"));
		this.loadWorldMap();
		this.setDefaultCamera();
	}
	
	public function loadWorldMap():Void
	{
		this.worldMap = new Ast_WorldMap();
		IGE.layer_GameWindow.addChild(this.worldMap);
		this.buildLevel(Assets.getMovieClip("coreAssets:Layout_WorldMap"));
	}
	
	public function setDefaultCamera()
	{
		IGE.coreCamera.setFollowObject(this.camera);
	}
	
	override public function parseLevelData(incCurrentObject:DisplayObject):Void
	{
		if (incCurrentObject.name == "base_Sphere")
		{
			this.camera = new Core_GameObject(incCurrentObject, incCurrentObject.name, Core_GameObject.body_Kinematic, Core_GameObject.bodyShape_Sphere);
		}
		if (incCurrentObject.name == "pip")
		{
			var obj:DisplayObject = new Ast_BlueSphere();//new Core_GameObject(incCurrentObject, "base_Sphere", Core_GameObject.body_Kinematic, Core_GameObject.bodyShape_Sphere);
			IGE.layer_GameWindow.addChild(obj);
			obj.scaleX = .2;
			obj.scaleY = .2;
			obj.x = incCurrentObject.x;
			obj.y = incCurrentObject.y;
			
		}

	}
	
	override public function update():Void 
	{
		super.update();
		this.camera.thumbStickDirectionMove(3);
	}
	
}