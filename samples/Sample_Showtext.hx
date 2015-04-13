package ;
import bitmapFont.BitmapTextField;
import coreClasses.Core_Text;
import coreClasses.GameController;
import bitmapFont.BitmapFont;
import bitmapFont.BitmapTextAlign;
import bitmapFont.TextBorderStyle;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.geom.Point;

/**
 * ...
 * @author 
 */
class Sample_Showtext extends GameController
{

	var textObject:Core_Text = new Core_Text();
	public function new() 
	{
		super();
		
		
		IGE.layer_OverLay.addChild(this.textObject.textField);
		
	}
	
}