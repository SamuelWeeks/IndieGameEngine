package samples;
import coreClasses.Core_State;
import IGE;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.display.MovieClip;

/**
 * ...
 * @author 
 */
class Sample_LoadingABitmap extends Core_State
{

	public function new() 
	{
		super();
		trace("sample_LoadingABitmapCreated");
		//var bitmap = new Bitmap (Assets.getBitmapData ("assets/openfl.png"));
		//Main.layer_GameWindow.addChild(bitmap);
		
		
		//bitmap.x = (Main.stage.stageWidth - bitmap.width) / 2;
		//bitmap.y = (Main.stage.stageHeight - bitmap.height) / 2;
		//this.createEnity("thing", 0, 100, "box", "idle", "box2");
		
		//var layerObject:MovieClip = Assets.getMovieClip("coreAssets:layer");
		//Main.layer_OverLay.addChild(layerObject);
	}
	
	override public function update():Void 
	{
		for (i in 0... this.updateGroup.length)
		{
			this.updateGroup[i].update();
			//var currentObject = this.updateGroup[i];
			//trace(currentObject);
		}
	}

	
}