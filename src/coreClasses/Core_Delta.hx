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
		//this has to be set because if u use the raw delta as is htlm5 will hang for some reason;
		//delta += .000000000001;
	}
	
}