package coreClasses;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.PixelSnapping;
import openfl.display.Sprite;
import spriter.engine.SpriterEngine;
import spriter.library.BitmapLibrary;

import openfl.Assets;
import spriter.library.SpriterLibrary;
import spriter.library.TilelayerLibrary;

/**
 * ...
 * @author Samuel Weeks
 */
class Core_SpriterLayer
{

	//Spriter layer lib------------------------------------
	 public var spriterRoot:Sprite;
	 public var lib:SpriterLibrary;
	 public var engine:SpriterEngine;
	 
	public function new(incScmlLocation:String,incLibLocation:String) 
	{
		this.spriterRoot = new Sprite();
		this.lib = new SpriterLibrary(incLibLocation);
		this.engine = new SpriterEngine(Assets.getText(incScmlLocation), this.lib, this.spriterRoot );
	}
	
	//tileLayerLib--------------------------------
	/*public var spriterRoot:Sprite;
	public var lib:TilelayerLibrary;
	public var engine:SpriterEngine;
	
	public function new() 
	{
		this.spriterRoot = new Sprite();
		Main.layer_OverLay.addChild(spriterRoot);
		this.lib = new TilelayerLibrary("assets/PwnStarGames_Intro.xml","assets/PwnStarGames_Intro.png");
		this.engine = new SpriterEngine(Assets.getText("assets/PwnStarGames_Intro.scml"), lib, spriterRoot);
	}*/
	
}