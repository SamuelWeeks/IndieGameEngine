package ;

import BraggingRights;
import coreClasses.Core_State;
import coreClasses.Core_StateController;
import coreClasses.*;
import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import openfl.display.DisplayObject;
import openfl.display.FPS;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.net.SharedObject;
import openfl.text.TextField;
import openfl.text.TextFormat;
import spriter.engine.SpriterEngine;
import spriter.library.SpriterLibrary;
//temp------
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.KeyboardEvent;
//nape----
import nape.util.BitmapDebug;
import nape.util.Debug;
import nape.geom.Vec2;
import nape.space.Space;
import openfl.Lib;

/**
 * ...
 * @author 
 */

class IGE extends Sprite 
{
	var inited:Bool;

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		else
		{
		changeScreenSize();
		}
	}
	
	function init() 
	{
		changeScreenSize();
		if (inited) return;
		inited = true;

		// (your code here)
		this.startGame();
		// Stage:
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
		
	}

	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new IGE());
	}
	
	//debug
	static public var debugWindowFlag:Bool = true;
	//gameEngineStart----------------------------------
	public static var coreState:Dynamic = new Core_State();
	//public static var coreStateController = new Core_StateController();
	//physics-----------------------------
	static public var corePhysics:Space = new Space(new Vec2(0, 100));
	#if flash
	static public var debug_Physics:Debug = new BitmapDebug(800, 600,0x333333);
	static public var debug_PhysicsDisplay:DisplayObject = debug_Physics.display;
	#end
	//layers-------------------------------------------
	public static var layer_GameWindow:Sprite = new Sprite();
	public static var layer_Spriter:Sprite = new Sprite();
	public static var spiterLib:SpriterLibrary = new SpriterLibrary("assets/");
	public static var spriterEngine:SpriterEngine;
	public static var layer_OverLay:Sprite = new Sprite();
	public static var layer_Debug:Sprite = new Sprite();
	//camera-
	static public var coreCamera:Core_Camera = new Core_Camera();
	//messageWindow---
	static public var coreSystemMessage:TextField = new TextField();
	//scalingWindows------
	static public var scaleAmount:Float;
	static public var base_WindowWidth:Float = 800;
	static public var base_WindowHeight:Float = 550;
	//updateGroup------------------------------------
	static public var updateGroup:Array<Dynamic> = new Array();
	static public var nextGameObjectName:Int = 1;
	static public var gameObjectGroup:Array<Core_GameObject> = new Array();
	//players----------------------------------------------
	static public var corePlayer1:Core_Player = new Core_Player("player1", "W", "S", "A", "D","Z","X","C","V");
	//timeDelta-
	static public var coreDelta:Core_Delta = new Core_Delta();
	//mouse position
	static public var mousePostionX:Float = Lib.current.mouseX;
	static public var mousePostionY:Float = Lib.current.mouseY;
	//stageoffSet
	static public var layeroffSetAmount:Float = 0;
	//save data----------
	static public var coreSaveFile:SharedObject = SharedObject.getLocal("defaultSave");
	
	
	
	
	
	
	public function prepareGame():Void
	{
		//nape----
		/*#if flash
		static public var debug_Physics:Debug = new BitmapDebug(800, 600,0x333333);
		static public var debug_PhysicsDisplay:DisplayObject = debug_Physics;
		#end*/
		IGE.spriterEngine = new SpriterEngine(Assets.getText('assets/coreAssets.scml'), IGE.spiterLib, IGE.layer_Spriter );
		//addLayers----
		#if flash
		IGE.debug_PhysicsDisplay.alpha = .7;
		#end
		this.addChild(layer_GameWindow);
		this.addChild(layer_Spriter);
		this.addChild(layer_OverLay);
		#if flash
		IGE.layer_OverLay.addChild(debug_PhysicsDisplay);
		#end
		this.addChild(layer_Debug);
		IGE.layer_Debug.addChild(new FPS());
		//----add message window-----
		
		IGE.layer_Debug.addChild(IGE.coreSystemMessage);
		coreSystemMessage.defaultTextFormat = new TextFormat ("_sans", 12, 0x000000);
		//coreSystemMessage.text = "sajhdajdikahkafkdafa";
		//
		
		this.loadAssets();
		this.configInputs();
		this.startFrameUpdate();
	}
	
	public function loadAssets()
	{
		//Assets.loadLibrary("Pet", onLibLoaded);
		
		/*Assets.loadLibrary ("coreAssets", function (_) {
			
			//var layout = Assets.getMovieClip ("layout:Layout");
			//var layerObject:MovieClip = Assets.getMovieClip("coreAssets:layer");
			//Main.layer_OverLay.addChild(layerObject);
			
		});*/
	}

	/*public function onLibLoaded(incSwf:AssetLibrary):Void
	{
		CGE.coreAssets = incSwf;
		this.startGame();
		
		var debugWindow:MovieClip = CGE.coreAssets.getMovieClip("text");
		layer_OverLay.addChild(debugWindow);
		trace(debugWindow.getChildByName("text"));*/
		/*var clip:MovieClip = CGE.coreAssets.getMovieClip("three");
		layer_OverLay.addChild(clip);
		clip.stop();
		trace(CGE.coreAssets.getMovieClip("three") + "!!!!!!");*/
		
	//}
	public function startGame():Void
	{
		this.prepareGame();
		Main.entryState();
	}
	
	public function configInputs():Void
	{
		Lib.current.stage.addEventListener (KeyboardEvent.KEY_DOWN, onBtnPressed);
		Lib.current.stage.addEventListener (KeyboardEvent.KEY_UP, onBtnReleased);
	}
	
	public function onBtnPressed(inc_Btn:KeyboardEvent):Void
	{
		IGE.coreState.inputActionPressed(inc_Btn);
	}
	
	public function onBtnReleased(inc_Btn:KeyboardEvent):Void
	{
		IGE.coreState.inputActionReleased(inc_Btn);
	}
	
	public function startFrameUpdate():Void
	{
		addEventListener(Event.ENTER_FRAME, onFrame);
	}
	
	public function onFrame(event:Event):Void
	{
		//delta---
		IGE.update();
	}
	
		public function changeScreenSize():Void
	{
		//this centers the spriter lyer, it seems to only work perfectly in html5, or in
		//openfl when its on its default window size. when full screen the scaling is off by just alittle
		//may have to fix later or allow user to move the screen to there likeing.
		this.configScaleAmount();
		//--------
		//Main.coreSystemMessage.text = "H" + stage.stageHeight + "/W" + stage.stageWidth + "/S" + scaleAmount;
		var halfStageWidth:Float = (stage.stageWidth / 2);
		var halfGameSize:Float = (base_WindowWidth * scaleAmount / 2);
		IGE.layeroffSetAmount = (halfStageWidth + -halfGameSize);
		IGE.layer_Spriter.x = (halfStageWidth + -halfGameSize);
		IGE.layer_GameWindow.x = (halfStageWidth + -halfGameSize);
		#if flash
		IGE.debug_PhysicsDisplay.x = (halfStageWidth + -halfGameSize);
		#end
		//Main.layer_OverLay.x =  (halfStageWidth + -halfGameSize);
		//!!!!!!!!!!!!!!!!
		trace("H  " + stage.stageHeight);
		trace("W  "  + stage.stageWidth);
		trace("W  "  + stage.stage.width);
		trace("L  " + IGE.layer_OverLay.width);
		var widthDiff = (stage.stageWidth - IGE.base_WindowWidth);
		trace("WD  " + widthDiff);
		trace("WD/2  " + widthDiff / 2);
		/*Main.layer_OverLay.x = ((widthDiff / 2) / 2.0);
		Main.layer_GameWindow.x = ((widthDiff / 2) / 2.0);
		Main.layer_Spriter.x = ((widthDiff / 2) / 2.0);*/
		//Main.Layer_OverLay.x = stage.width;
		//Main.Layer_OverLay.x = stage.stageWidth;
	}
	
	public function configScaleAmount():Void
	{

		trace("currentHeight" + this.stage.stageHeight);
		trace("currentBase" + IGE.base_WindowHeight);
		scaleAmount = ( stage.stageHeight / IGE.base_WindowHeight);
		trace(this + "scaleAmount =" + scaleAmount);
		//Main.html5_ScaleAmount = (Main.html5_WindiowHeight / Main.base_WindowHeight);
		//trace("html" + Main.html5_ScaleAmount);
		//CC_ResizeTO(Main.Layer_OverLay);
		//CC_Center(Main.Layer_OverLay);
		this.ScaleWindowlayers();
	}
	
	public function ScaleWindowlayers():Void
	{
		IGE.layer_OverLay.scaleX = Math.round(IGE.scaleAmount);
		IGE.layer_OverLay.scaleY = Math.round(IGE.scaleAmount);
		IGE.layer_OverLay.scaleX = IGE.scaleAmount;
		IGE.layer_OverLay.scaleY = IGE.scaleAmount;
		
		IGE.layer_GameWindow.scaleX = Math.round(IGE.scaleAmount);
		IGE.layer_GameWindow.scaleY = Math.round(IGE.scaleAmount);
		IGE.layer_GameWindow.scaleX = IGE.scaleAmount;
		IGE.layer_GameWindow.scaleY = IGE.scaleAmount;
		
		IGE.layer_Spriter.scaleX = Math.round(IGE.scaleAmount);
		IGE.layer_Spriter.scaleY = Math.round(IGE.scaleAmount);
		IGE.layer_Spriter.scaleX = IGE.scaleAmount;
		IGE.layer_Spriter.scaleY = IGE.scaleAmount;
		#if flash
		IGE.debug_PhysicsDisplay.scaleX = Math.round(IGE.scaleAmount);
		IGE.debug_PhysicsDisplay.scaleY = Math.round(IGE.scaleAmount);
		IGE.debug_PhysicsDisplay.scaleX = IGE.scaleAmount;
		IGE.debug_PhysicsDisplay.scaleY = IGE.scaleAmount;
		#end
		
		IGE.layer_Debug.scaleX = Math.round(IGE.scaleAmount);
		IGE.layer_Debug.scaleY = Math.round(IGE.scaleAmount);
		IGE.layer_Debug.scaleX = IGE.scaleAmount;
		IGE.layer_Debug.scaleY = IGE.scaleAmount;
	}
	
	static public function debugPhysicsDraw():Void
	{
		#if flash
		debug_Physics.clear();
		debug_Physics.draw(IGE.corePhysics);
		debug_Physics.flush();
		#end
	}
	
	static public function destroyUpdateGroup():Void
	{
		//Main.updateGroup[1].destroySelf = true;
		//Main.spriterEngine.getEntity("thing").destroy();
		/*for (i in 0... Main.updateGroup.length)
		{
			Main.updateGroup[i].destroy();
			Main.updateGroup.pop[i];
			
		}*/
	}

	
	static public function update():Void
	{
		IGE.coreState.update();
		//nape----
		IGE.debugPhysicsDraw();
		//delta----
		IGE.coreDelta.update();
		trace("deltatime!!!!" + IGE.coreDelta.delta);
		if (IGE.coreDelta.delta > 0)
		{
		IGE.corePhysics.step(IGE.coreDelta.delta, 60);
		}
		
		//objectgroup-------------------------
		for (i in 0... IGE.updateGroup.length)
		{
			IGE.updateGroup[i].update();
			/*var currentObject = Main.updateGroup[i];
			trace(currentObject);*/
		}
		//spriter---
		IGE.spriterEngine.update();
		IGE.coreCamera.update();
		//update mouse postion-------------
		IGE.mousePostionX = Lib.current.mouseX;
		IGE.mousePostionY = Lib.current.mouseY;
	}
}
