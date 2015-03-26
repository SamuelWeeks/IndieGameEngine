package coreClasses;
import bitmapFont.BitmapTextField;
import openfl.Assets;
import openfl.display.BitmapData;
import bitmapFont.BitmapFont;
import bitmapFont.BitmapTextAlign;

/**
 * ...
 * @author 
 */
class Core_Text
{

	public var textField:BitmapTextField;
	public function new() 
	{
		// And finally lets test AngelCode font
		var fontXML:Xml = Xml.parse(Assets.getText("assets/fonts/font.fnt"));
		var fontImage:BitmapData = Assets.getBitmapData("assets/fonts/font.png");
		var angelCodeFont:BitmapFont = BitmapFont.fromAngelCode(fontImage, fontXML);
		
		
		this.textField = new BitmapTextField(angelCodeFont);
		this.textField.text = "its my game time homeboy";
		//this.textField.alignment =  BitmapTextAlign.CENTER;
		this.textField.autoSize = false;
		//this.textField.wordWrap = true;
		this.textField.wrapByWord = true;
		this.textField.width = 400;
		this.textField.y = 0;
		this.textField.padding = 3;
		this.textField.lineSpacing = 3;
		//this.textField.
		//this.textField.multiLine = true;
		
		//this.textField.scaleX = .5;
		//this.textField.scaleY = .5;
	}
	
}