package coreClasses;
import openfl.Lib;
/**
 * ...
 * @author 
 */
class Core_Delta
{

	public var currentTime:Dynamic;
	public var delta:Float = 0;
	public var lastTimer:Float = 0;
	
	public function new() 
	{

	}
	
	public function update():Void
	{
		this.currentTime = Lib.getTimer ();
		this.delta = (currentTime - lastTimer) / 1000;
		
		this.lastTimer = this.currentTime;
	}
	
}