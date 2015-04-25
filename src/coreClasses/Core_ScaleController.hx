package coreClasses;
import openfl.Lib;
import openfl.events.Event;
import openfl.display.Sprite;

/**
 * ...
 * @author Samuel Weeks
 */
class Core_ScaleController
{

	public var baseWidth:Float;
	public var baseHeight:Float;
	public  var scaleAmount:Float;
	public var halfStageWidth:Float;
	public var halfGameSize:Float;
	

	public function new(incWidth:Float,incHeight:Float) 
	{
		this.baseWidth = incWidth;
		this.baseHeight = incHeight;
		//Lib.current.stage.addEventListener(Event.RESIZE, onResize);
		//this.onResize(Event.RESIZE);
	}
	
	public  function onResize(e:Event ):Void
	{
		var amount:Float = this.changeScreenSize();
		
		for (i in 0... IGE.layer_Group.length)
		{
			var currentlayer:Dynamic = IGE.layer_Group[i];
			currentlayer.scaleX = amount;
			currentlayer.scaleY = amount;
			currentlayer.x = (Lib.current.stage.stageWidth / 2) + -(IGE.coreScaleController.baseWidth * amount / 2);
		}
	}
	

	
	public function changeScreenSize():Float
	{
		this.scaleAmount = ( Lib.current.stage.stageHeight / this.baseHeight);
		this.halfStageWidth = (Lib.current.stage.stageWidth / 2);
		this.halfStageWidth = (this.baseWidth * (this.scaleAmount / 2));
		trace("scaleController-- resizeEvent");
		return(this.scaleAmount);
		
	}
	
}