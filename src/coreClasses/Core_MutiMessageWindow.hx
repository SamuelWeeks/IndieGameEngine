
package coreClasses;
import bitmapFont.BitmapTextField;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import bitmapFont.BitmapTextAlign;

/**
 * ...
 * @author sam weeks
 */
class Core_MutiMessageWindow extends Sprite
{

	public var backgroundObject:Bitmap = new Bitmap();
	public var textObject:BitmapTextField = new BitmapTextField(IGE.coreFonts.Font_White);
	public var textNodes:Array<String> = new Array();
	public var currentTextNode:Int = 0;
	//public var backGroundImage:Bitmap = new Bitmap(Assets.getBitmapData("assets/content/testing/images/Tile_GenericGreen.png"));
	public function new() 
	{
		super();
		configSelf();
		this.pushFludffText();
	
	}
	
	public function pushFludffText():Void
	{
		this.pushText("");
		this.pushText("");
		this.pushText("");
		this.pushText("");
		this.pushText("New MessagewIndow created");

		
	}
	
	function configSelf():Void
	{
		//this.addChild(this.backGroundImage);
		//this.backGroundImage.width = 800;
		this.addChild(this.backgroundObject);
		//this.textObject.font = CGE.coreFonts.Font_White;
		//this.textObject.useTextColor = true;
		//this.textObject.textColor = 0xFF0000;
		this.backgroundObject.bitmapData = (Assets.getBitmapData("assets/img/bitmapSamples/darkGrey.png"));
		this.backgroundObject.alpha = .7;
		this.addChild(this.textObject);
		//this.textObject.borderSize = 10;
		this.textObject.autoSize = false;
		this.textObject.width = 600;
		this.textObject.wrapByWord = true;
		this.textObject.background = true;
		//this.textObject.backgroundColor = 0xFF000000;
		this.textObject.padding = 3;
		this.textObject.lineSpacing = 3;
		
		this.textObject.y = this.textObject.y +this.textObject.height;
		this.textObject.alignment =  BitmapTextAlign.LEFT;
		//this.textObject.multiLine = true;
		//this.textObject.
		//this.textObject.width = 10;
	}
	
	public function pushText(incText:String):Void
	{
		this.textNodes.push(incText);
		this.textObject.text =    textNodes[this.currentTextNode-4] +"\n"+textNodes[this.currentTextNode-3] +"\n"+textNodes[this.currentTextNode-2] +"\n"+textNodes[this.currentTextNode-1] +"\n"+ this.textNodes[this.currentTextNode];
		this.currentTextNode++;
	}
	
}