package coreClasses;
import bitmapFont.BitmapFont;
import openfl.display.BitmapData;
import openfl.Assets;

/**
 * ...
 * @author fff
 */
class Core_Fonts
{

	//!notes-----------------------------
	//////seems to be a bug where it only reads one color at a time
	public var Font_Default:BitmapFont;
	public var Font_White:BitmapFont;
	
		
	public function new() 
	{
		//default-------
		var defaultFontXML:Xml = Xml.parse(Assets.getText("assets/fonts/defaultFont.fnt"));
		var defaultFontImage:BitmapData = Assets.getBitmapData("assets/fonts/defaultFont_0.png");
		this.Font_Default = BitmapFont.fromAngelCode(defaultFontImage, defaultFontXML);
		//white
		var whiteFontXML:Xml = Xml.parse(Assets.getText("assets/fonts/whiteFont.fnt"));
		var whiteFontImage:BitmapData = Assets.getBitmapData("assets/fonts/whiteFont_0.png");
		this.Font_White = BitmapFont.fromAngelCode(whiteFontImage, whiteFontXML);
	}
	
	public function configSelf():Void
	{
		
		
	}
	
}