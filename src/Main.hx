package;
import BraggingRights;
import openfl.display.Sprite;

/**
 * ...
 * @author Samuel Weeks
 */
class Main extends Sprite
{

	var gameEngine:IGE = new IGE();
	public function new() 
	{
		super();
		this.addChild(this.gameEngine);
	}
	
	static public function entryState():Void
	{
		IGE.coreState = new BraggingRights();
	}
	
}