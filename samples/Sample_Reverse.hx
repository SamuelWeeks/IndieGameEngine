package ;
import coreClasses.Core_GameObject;
import coreClasses.GameController;
import openfl.Assets;
import openfl.display.MovieClip;
import openfl.display.DisplayObject;
import nape.geom.Vec2;

/**
 * ...
 * @author 
 */
class Sample_Reverse extends GameController
{

	public function new() 
	{
		super();
		this.buildLevel(Assets.getMovieClip("coreAssets:level1"));
	}
	
	override public function parseLevelData(incCurrentObject:DisplayObject):Void
	{
		switch(incCurrentObject.name)
			{
				case "green":new Core_GameObject(incCurrentObject.x,incCurrentObject.y,"static");//this.createEnity("thing1", incCurrentObject.x, incCurrentObject.y, "greenBox", "base", "box");
				case "blue":new GameObj_BlueBox(incCurrentObject.x, incCurrentObject.y,"dynamic");//this.createEnity("thing", incCurrentObject.x, incCurrentObject.y, "blueBox", "Spin", "box2");
			}
	}
	
	override public function playerBtnTapped(incPlayer:String, incBtn:String):Void 
	{
		//super.playerBtnTapped(incPlayer, incBtn);
		if (incBtn == "btn1")
		{
			new GameObj_BlueBox(100, 100,"dynamic");
		}
		if (incBtn == "btn2")
		{
			new GameObj_BlueBox(200, 100,"dynamic");
		}
		if (incBtn == "btn3")
		{
			new GameObj_BlueBox(300, 100,"dynamic");
		}
		if (incBtn == "btn4")
		{
			new GameObj_BlueBox(400, 100,"dynamic");
		}
	}
	
	override public function update():Void 
	{
		super.update();
		if (Main.corePlayer1.btnUpPressed == true)
		{
			Main.coreSystemMessage.text = "upBtn";
			Main.corePhysics.gravity = (new Vec2(0, -100));
		}
		if (Main.corePlayer1.btnDownPressed == true)
		{
			Main.coreSystemMessage.text = "DownBtn";
			Main.corePhysics.gravity = (new Vec2(0, 100));
		}
		if (Main.corePlayer1.btnLeftPressed == true)
		{
			Main.coreSystemMessage.text = "leftBtn";
			Main.corePhysics.gravity = (new Vec2(-100, 0.0));
		}
		if (Main.corePlayer1.btnRightPressed == true)
		{
			Main.coreSystemMessage.text = "rightBtn";
			Main.corePhysics.gravity = (new Vec2(100, 0.0));
		}
		
	}
	
	
	
}

