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
	//fonts
	public var font_Black:BitmapFont = BitmapFont.fromAngelCode(Assets.getBitmapData("assets/fonts/blackFont.png"), Xml.parse(Assets.getText("assets/fonts/blackFont.fnt")));
	public var font_White:BitmapFont = BitmapFont.fromAngelCode(Assets.getBitmapData("assets/fonts/whiteFont.png"), Xml.parse(Assets.getText("assets/fonts/whiteFont.fnt")));
	//text shortcuts, only way i can think of for html5 to allow picking bmpfont, static doesnt work
	static public var whiteFont:String = "whiteFont";
	static public var blackFont:String = "blackFont";
	public function new(incBmpFont:String, incX:Float, incY:Float, incScaling:Float, incText:String) 
	{
	 
		switch(incBmpFont)
		{
			case "whiteFont":this.textField = new BitmapTextField(this.font_White);
			case "blackFont":this.textField = new BitmapTextField(this.font_Black);
		}
		this.textField.scaleX = incScaling;
		this.textField.scaleY = incScaling;
		this.textField.x = incX;
		this.textField.y = incY;
		this.textField.text = incText;
		//this.textField.alignment =  BitmapTextAlign.CENTER;
		this.textField.autoSize = false;
		//this.textField.wordWrap = true;
		this.textField.wrapByWord = true;
		this.textField.width = 1000;
		//this.textField.y = 0;
		this.textField.padding = 3;
		this.textField.lineSpacing = 3;
		//this.textField.
		//this.textField.multiLine = true;
		
		//this.textField.scaleX = .5;
		//this.textField.scaleY = .5;
	}
	
	public function setBitMapFont():Void
	{
		//this.bitMapFont = 
	}
	
}