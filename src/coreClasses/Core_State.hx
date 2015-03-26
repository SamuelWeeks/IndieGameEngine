package coreClasses;
import coreClasses.Core_SpriterLayer;
import nape.phys.Body;
import nape.shape.Polygon;
import nape.phys.BodyType;
import openfl.display.DisplayObject;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import spriter.engine.Spriter;

/**
 * ...
 * @author 
 */
@:keepSub class Core_State
{

	public var changeStateFlag:Bool;
	public var PhyBody:Body;
	public var layoutSprite:Sprite = new Sprite();
	public var updateGroup:Array<Dynamic> = new Array();
	public function new() 
	{
		
	}

	public function inputActionPressed(inc_Input:KeyboardEvent):Void 
	{
				Main.corePlayer1.inputActionPressed(inc_Input);
				//pressing the a key loads a bitmap to the screen;
				switch(inc_Input.keyCode)
				{
					case Keyboard.RIGHT:this.moveGameWindow(150,0);
					case Keyboard.LEFT:this.moveGameWindow(-150,0);
					case Keyboard.UP:this.moveGameWindow(0,-150);
					case Keyboard.DOWN:this.moveGameWindow(0,150);
					case Keyboard.BACKQUOTE:this.toggleDebugWIndow();
					case Keyboard.PAGE_UP:this.zoomGameWindowIn();
					case Keyboard.PAGE_DOWN:this.zoomGameWindowOut();
				}
	}
	//-----player button presse----------------------
	
	public function playerBtnTapped(incPlayer:String,incBtn:String):Void 
	{
		trace("!!"+incPlayer+ "btn tapped " +incBtn);
	}
	
	public function playerBtnUnTapped(incPlayer:String, incBtn:String):Void
	{
		trace("!!"+incPlayer+ "btn unTapped "+ incBtn);
	}
	
	public function moveGameWindow(incMoveX:Int,incMoveY:Int):Void
	{
		if (Main.debugWindowFlag == true)
		{
			Main.layer_Spriter.x += (incMoveX * Main.coreDelta.delta);
			Main.layer_Spriter.y += (incMoveY *Main.coreDelta.delta);
			
		}
	}
	
	public function zoomGameWindowIn():Void
	{
		if (Main.debugWindowFlag == true)
		{
			Main.layer_GameWindow.scaleX += .1;
			Main.layer_GameWindow.scaleY += .1;
		}
	}
	
	public function zoomGameWindowOut():Void
	{
		if (Main.debugWindowFlag == true)
		{
			Main.layer_GameWindow.scaleX -= .1;
			Main.layer_GameWindow.scaleY -= .1;
			
			Main.layer_Spriter.scaleX -= .1;
			Main.layer_Spriter.scaleY -= .1;
			
		}
	}
	
	public function toggleDebugWIndow():Void
	{
		
		switch(Main.debugWindowFlag)
				{
					case false:
						{
							Main.layer_Debug.visible = true;
							Main.debugWindowFlag = true;
						}
					case true:
						{
							Main.layer_Debug.visible = false;
							Main.debugWindowFlag = false;
						}
					
				}

	}
	
	public function createEnity(incName:String,incX:Float,incY:Float,incEnity:String,incEnityAnimation:String,bodyName:String):Void
	{
		//var currentObject:Core_GameObject = new Core_GameObject(incName,incX,incY,bodyName);
		//Main.spriterEngine.getEntity(incName).playAnimFromEntity(incEnity, incEnityAnimation,currentObject.animationEnd);
		//Main.spriterEngine.getEntity(incName).playAnim(incEnityAnimation,animationDone);
		//currentObject.update();
	}
	
	
	public function applyRigidBody(incName:String,incX:Float,incY:Float):Void
	{
		if (incName == "box")
		{
		this.PhyBody = new Body(BodyType.STATIC);
		this.PhyBody.shapes.add(new Polygon(Polygon.box(40, 40)));
		this.PhyBody.position.x = incX;
		this.PhyBody.position.y = incY;
		this.PhyBody.space = Main.corePhysics;
		
		}
		if (incName == "box2")
		{
		this.PhyBody = new Body(BodyType.DYNAMIC);
		this.PhyBody.shapes.add(new Polygon(Polygon.box(40,40)));
		this.PhyBody.space = Main.corePhysics;
		this.PhyBody.position.x = incX;
		this.PhyBody.position.y = incY;
		}
	}
	
	public inline function inputActionReleased(inc_Input:KeyboardEvent):Void 
	{
				Main.corePlayer1.inputActionReleased(inc_Input);
	}
	
	public function buildLevel(incLevelData:MovieClip):Void
	{
		var levelData = incLevelData;
		for (i in 0... levelData.numChildren)
		{
			var numOfCalls:Int = 0;
			var currentObject:DisplayObject = levelData.getChildAt(i);
			this.parseLevelData(currentObject);	
		}
		
	}
	
	///currently this does not really remve all gameobjedts, just the spriter objects and phyics objcts they are part of.
	//needs to be updated to really remove the game objects
	public function destroyAllGameObjects():Void
	{
		while (Main.gameObjectGroup.length > 1 )
		{
			var objToDestroy:Core_GameObject = Main.gameObjectGroup.pop();
			objToDestroy.destroySelf();
		}
	}
	
	public function parseLevelData(incCurrentObject:DisplayObject):Void
	{
		/*switch(incCurrentObject.name)
			{
				case "green":this.createEnity("thing", incCurrentObject.x, incCurrentObject.y, "greenBox", "idle", "box");
				case "blue":this.createEnity("thing", incCurrentObject.x, incCurrentObject.y, "blueBox", "idle", "box2");
			}*/
	}
	
	public function update():Void 
	{

	}
	
}