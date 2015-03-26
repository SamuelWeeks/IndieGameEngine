package coreClasses;
import openfl.display.DisplayObject;
import spriter.engine.Spriter;

/**
 * ...
 * @author ...
 */
class GameObj_ColWall extends Core_GameObject
{

	public function new(incObject:DisplayObject,incEnityName:String,incPhyBodyType:String,incPhyBodyShape:String)  
	{
		super(incObject,incEnityName,incPhyBodyType,incPhyBodyShape);
	}
	
	override public function configSelf():Void 
	{
		//super.configSelf();
		this.enityName = "greenBox";
		this.currenntBodyShape = Core_GameObject.bodyShape_Box;
	}
	
	override public function setSpriterObject(incObject:DisplayObject):Void 
	{
		//super.setSpriterObject(incObject);
	}
	override public function animationEnd(incSpriterObject:Spriter, incEntityName:String, incAnim:String):Void 
	{
		super.animationEnd(incSpriterObject, incEntityName, incAnim);
		switch(incAnim)
		{
			case "base"://incSpriterObject.playAnim("base", this.animationEnd);
			//case "base":incSpriterObject.playAnim("Spin", this.animationEnd);
			//case "Spin":this.destroySelf();
		}
	}
	
	override public function update():Void 
	{
		//super.update();
	}
	
}