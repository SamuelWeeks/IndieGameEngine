package ;
import coreClasses.Core_Text;
import coreClasses.GameObj_ColWall;
import coreClasses.Core_GameObject;
import coreClasses.GameController;
import openfl.Assets;
import openfl.display.MovieClip;
import openfl.display.DisplayObject;
import nape.geom.Vec2;

/**
 * ...
 * @author ...
 */
class Sample_OverHeadMovement extends GameController
{

	var controlObject:Core_GameObject;
	var controlObjectAngle:Float;
	var movementSpeed:Float = 100;
	var greenBox:Core_GameObject;
	public function new() 
	{
		super();
		this.buildLevel(Assets.getMovieClip("coreAssets:sample_OverHead"));
		Main.corePhysics.gravity = (new Vec2(0.0, 0.0));
		Main.coreCamera.setFollowObject(this.controlObject);
		this.controlObject.RotateType = Core_GameObject.rotate_Normal;
		this.controlObject.target = this.greenBox;
		if (Main.coreSaveFile.data.positionX != null)
		{
		this.controlObject.PhyBody.position.x = Main.coreSaveFile.data.positionX;
		}
		if ( Main.coreSaveFile.data.positionY != null)
		{
		this.controlObject.PhyBody.position.y = Main.coreSaveFile.data.positionY;
		}
		
		/*var textObject:Core_Text = new Core_Text();
		Main.layer_OverLay.addChild(textObject.textField);
		textObject.textField.text = "alalalalalala";*/
	}
	
	override public function parseLevelData(incCurrentObject:DisplayObject):Void
	{
		if (incCurrentObject.name != "wall" && incCurrentObject.name != "map")
		{
			
			this.controlObject = new Core_GameObject(incCurrentObject, incCurrentObject.name, Core_GameObject.body_Dynamic,Core_GameObject.bodyShape_Sphere);
		}
		if(incCurrentObject.name == "wall")
		{
			this.greenBox = new GameObj_ColWall(incCurrentObject, incCurrentObject.name, Core_GameObject.body_Static,Core_GameObject.bodyShape_Box);
		}
		/*switch(incCurrentObject.name)
			{
				case "wall":this.greenBox = new GameObj_ColWall(incCurrentObject,incCurrentObject.name,Core_GameObject.body_Static);
				case "base_Sphere":this.controlObject = new GameObj_BlueSphere(incCurrentObject, incCurrentObject.name, Core_GameObject.body_Dynamic);
				case"dog":
			}*/
			var tilemap:MovieClip = (new Ast_WorldMap());
			Main.layer_GameWindow.addChild(tilemap);
	}
	
	override public function playerBtnTapped(incPlayer:String, incBtn:String):Void 
	{
		//super.playerBtnTapped(incPlayer, incBtn);
		if (incBtn == "btn1")
		{
			//this.controlObject.RotateType = Core_GameObject.rotate_ToTarget;
			//this.controlObject.doRayCast(this.controlObject.target.PhyBody.position, 1000);
			Main.coreSaveFile.data.positionX = this.controlObject.PhyBody.position.x;
			Main.coreSaveFile.data.positionY = this.controlObject.PhyBody.position.y;
			Main.coreSaveFile.flush();
			this.controlObject.doAnimation("base");
			
		}
		if (incBtn == "btn2")
		{
			this.controlObject.RotateType = Core_GameObject.rotate_ToThumbStick;
			this.controlObject.doAnimation("red");
		}
		if (incBtn == "btn3")
		{
			//Main.coreCamera.setFollowObject(this.greenBox);
			this.controlObject.doAnimation("yellow");
		}
		if (incBtn == "btn4")
		{
			this.controlObject.RotateType = Core_GameObject.rotate_ForwardMovemet;
			this.controlObject.doAnimation("green");
			this.destroyAllGameObjects();
		}
	}
	
	override public function update():Void 
	{
		super.update();
		/*if (Main.corePlayer1.btnUpPressed == true)
		{
			Main.coreSystemMessage.text = "upBtn";
			this.controlObject.PhyBody.position.y -= (this.movementSpeed  * Main.coreDelta.delta);
		}
		if (Main.corePlayer1.btnDownPressed == true)
		{
			Main.coreSystemMessage.text = "DownBtn";
			this.controlObject.PhyBody.position.y += (this.movementSpeed  * Main.coreDelta.delta);
		}
		if (Main.corePlayer1.btnLeftPressed == true)
		{
			Main.coreSystemMessage.text = "leftBtn";
			this.controlObject.PhyBody.position.x -= (this.movementSpeed  * Main.coreDelta.delta);
		}
		if (Main.corePlayer1.btnRightPressed == true)
		{
			Main.coreSystemMessage.text = "rightBtn";
			this.controlObject.PhyBody.position.x += (this.movementSpeed  * Main.coreDelta.delta);
		}*/
		
		//movement-----------
		this.controlObject.thumbStickDirectionMove(this.controlObject.baseMovementSpeed );
	}
	
}