package;
import coreClasses.GameController;
import openfl.display.DisplayObject;
import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class Sample_ScreenLayout extends GameController
{
	var layout:DisplayObject = new Ast_Sample_layout();
	public function new() 
	{
		super();
		IGE.coreCamera.setFollowObject(this.layout);
		//IGE.layer_GameWindow.addChild(new Ast_Sample_Layout());
		
		
	}
	
	
	
}