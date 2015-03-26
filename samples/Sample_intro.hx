package ;
import coreClasses.GameController;
import openfl.display.DisplayObject;
import openfl.display.Sprite;

/**
 * ...
 * @author 
 */
class Sample_intro extends GameController
{

	var dummyDisplayObject:Sprite = new Sprite();//!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	public function new() 
	{
		super();
		this.gui.visible = false;
		this.playIndieIntro();
	}
	
	public function playIndieIntro():Void
	{
		//this.createEnity("thing", 0, 0, "greenBox", "idle", "box");
	}
	
	override public function update():Void 
	{
		super.update();
		//new GameObj_BlueBox(incCurrentObject, "d");
	}
	
}