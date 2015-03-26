package coreClasses ;
import com.iainlobb.gamepad.Gamepad;
import com.iainlobb.gamepad.OnScreenJoystick;
import coreClasses.Core_GameObject;
import coreClasses.Core_State;
import motion.Actuate;
import openfl.display.DisplayObject;
import openfl.display.MovieClip;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.geom.Point;
import openfl.ui.Multitouch;
import openfl.ui.MultitouchInputMode;
import openfl.events.TouchEvent;
import openfl.Lib;
import nape.space.Space;
import nape.geom.Vec2;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

/**
 * ...
 * @author 
 */
class GameController extends Core_State
{

	var gui:MovieClip = Assets.getMovieClip("coreAssets:Gui_ActionBtns");
	var useMutiTouch:Bool = false;
	var useOnScreenJoyStick:Bool = false;
	public function new() 
	{
		super();
		this.createControls();
		if (this.useOnScreenJoyStick != true)
		{
			this.gamePad.useWASD(true);
			this.gamePad.isCircle = true;
		}	
	}
	
	public function createControls():Void
	{
		// Find out whether multitouch is supported
		var multiTouchSupported = Multitouch.supportsTouchEvents;
		if (multiTouchSupported)
		{
			this.useMutiTouch = true;
			this.createOnScreenJoyStick();
			this.addGuiControls();
			
			// If so, set the input mode and hook up our event handlers
			// TOUCH_POINT means simple touch events will be dispatched, 
			// rather than gestures or mouse events
			Multitouch.inputMode = MultitouchInputMode.NONE;
			
			Lib.current.stage.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
			//Lib.current.stage.addEventListener(TouchEvent.TOUCH_TAP, onTouchBegin);
			//Lib.current.stage.addEventListener(TouchEvent.TOUCH_MOVE, onTouchEnd);
			Lib.current.stage.addEventListener(TouchEvent.TOUCH_END, onTouchEnd);
			Lib.current.stage.addEventListener(TouchEvent.TOUCH_OUT, onTouchEnd);
			Lib.current.stage.addEventListener(TouchEvent.TOUCH_ROLL_OUT, onTouchEnd);
			Lib.current.stage.addEventListener(TouchEvent.TOUCH_OVER, onTouchEnd);
			
	
		}
	}
	

	//-----------------------------------------------------
	public function addGuiControls():Void
	{
			Main.layer_OverLay.addChild(gui);
			this.gui.alpha = .5;
			this.gui.x = Lib.current.stage.stageWidth + Main.layeroffSetAmount;
			//this.gui.x += (Main.layeroffSetAmount) *2;
			this.gui.y = 525;
	}
	
	
	
	private function onTouchBegin(e:TouchEvent):Void 
	{
		
		if (e.target == this.gui.getChildByName("btnUp"))
		{
			if (Main.corePlayer1.btnUpPressed == false)
					{
						Main.corePlayer1.btnUpPressed = true;
						Main.coreState.playerBtnTapped(Main.corePlayer1.playerName, "btnUp");
					}
		}
		
		if (e.target == this.gui.getChildByName("btnDown"))
		{
			if (Main.corePlayer1.btnDownPressed == false)
					{
						Main.corePlayer1.btnDownPressed = true;
						Main.coreState.playerBtnTapped(Main.corePlayer1.playerName, "btnDowm");
					}
		}
		
		if (e.target == this.gui.getChildByName("btnLeft"))
		{
			if (Main.corePlayer1.btnLeftPressed == false)
					{
						Main.corePlayer1.btnLeftPressed = true;
						Main.coreState.playerBtnTapped(Main.corePlayer1.playerName, "btnLeft");
					}
		}
		if (e.target == this.gui.getChildByName("btnRight"))
		{
			if (Main.corePlayer1.btnRightPressed == false)
					{
						Main.corePlayer1.btnRightPressed = true;
						Main.coreState.playerBtnTapped(Main.corePlayer1.playerName, "btnRight");
					}
		}
		if (e.target == this.gui.getChildByName("btn1"))
		{
			if (Main.corePlayer1.btn1Pressed == false)
					{
						Main.corePlayer1.btn1Pressed = true;
						Main.coreState.playerBtnTapped(Main.corePlayer1.playerName, "btn1");
					}
		}
		if (e.target == this.gui.getChildByName("btn2"))
		{
			if (Main.corePlayer1.btn2Pressed == false)
					{
						Main.corePlayer1.btn2Pressed = true;
						Main.coreState.playerBtnTapped(Main.corePlayer1.playerName, "btn2");
					}
		}
		if (e.target == this.gui.getChildByName("btn3"))
		{
			if (Main.corePlayer1.btn3Pressed == false)
					{
						Main.corePlayer1.btn3Pressed = true;
						Main.coreState.playerBtnTapped(Main.corePlayer1.playerName, "btn3");
					}
		}
		if (e.target == this.gui.getChildByName("btn4"))
		{
			if (Main.corePlayer1.btn4Pressed == false)
					{
						Main.corePlayer1.btn4Pressed = true;
						Main.coreState.playerBtnTapped(Main.corePlayer1.playerName, "btn4");
					}
		}
	}
	
	private function onTouchEnd(e:TouchEvent):Void 
	{
		if (e.target == this.gui.getChildByName("btnUp"))
		{
			Main.corePlayer1.btnUpPressed = false;
			Main.coreState.playerBtnUnTapped(Main.corePlayer1.playerName, "btnUp");
		}
		if (e.target == this.gui.getChildByName("btnDown"))
		{
			Main.corePlayer1.btnDownPressed = false;
			Main.coreState.playerBtnUnTapped(Main.corePlayer1.playerName, "btnDown");
		}
		if (e.target == this.gui.getChildByName("btnLeft"))
		{
			Main.corePlayer1.btnLeftPressed = false;
			Main.coreState.playerBtnUnTapped(Main.corePlayer1.playerName, "btnLeft");
		}
		if (e.target == this.gui.getChildByName("btnRight"))
		{
			Main.corePlayer1.btnRightPressed = false;
			Main.coreState.playerBtnUnTapped(Main.corePlayer1.playerName, "btnRight");
		}
		if (e.target == this.gui.getChildByName("btn1"))
		{
			Main.corePlayer1.btn1Pressed = false;
			Main.coreState.playerBtnUnTapped(Main.corePlayer1.playerName, "btn1");
		}
		if (e.target == this.gui.getChildByName("btn2"))
		{
			Main.corePlayer1.btn2Pressed = false;
			Main.coreState.playerBtnUnTapped(Main.corePlayer1.playerName, "btn2");
		}
		if (e.target == this.gui.getChildByName("btn3"))
		{
			Main.corePlayer1.btn3Pressed = false;
			Main.coreState.playerBtnUnTapped(Main.corePlayer1.playerName, "btn3");
		}
		if (e.target == this.gui.getChildByName("btn4"))
		{
			Main.corePlayer1.btn4Pressed = false;
			Main.coreState.playerBtnUnTapped(Main.corePlayer1.playerName, "btn4");
		}
	}


	private function onTouchMove(e:TouchEvent):Void 
	{

	}
	
	//gamePad---------------
	var gamePad:Gamepad = new Gamepad(Lib.current.stage, true, 0.4);
	var thumbStick:Sprite = new Sprite();
	var joyStickBackGround:Sprite = new Sprite();
	var gamePadView:OnScreenJoystick; //= new OnScreenJoystick();
	
	
	public function createOnScreenJoyStick():Void
	{
		this.useOnScreenJoyStick = true;
		
	#if flash
		//make thumbstick
		this.gamePadView = new OnScreenJoystick();
		Main.layer_OverLay.addChild(this.gamePadView);
		this.thumbStick.graphics.beginFill(0xEC0000,.5);
		this.thumbStick.graphics.drawCircle(25, 25, 25);
		this.thumbStick.scaleX = 2.5;
		this.thumbStick.scaleY = 2.5;

		var global:Point = thumbStick.globalToLocal(new Point(0,0));
		//make joystick background
		this.joyStickBackGround.graphics.beginFill(0xC0C0C0, 0.2);
		this.joyStickBackGround.graphics.drawCircle(50, 50, 50);
		this.joyStickBackGround.scaleX = 2.5;
		this.joyStickBackGround.scaleY = 2.5;

		this.gamePadView.init(this.gamePad, 50, this.thumbStick, this.joyStickBackGround);
		this.gamePadView.x = (this.joyStickBackGround.width / 2)+20;
		this.gamePadView.y = 400;
	#end
	
	#if !flash
		//make thumbstick
		this.gamePadView = new OnScreenJoystick();
		Main.layer_OverLay.addChild(this.gamePadView);
		this.thumbStick.graphics.beginFill(0xEC0000,.5);
		this.thumbStick.graphics.drawCircle(25, 25, 25);
		this.thumbStick.scaleX = 2.5;
		this.thumbStick.scaleY = 2.5;

		var global:Point = thumbStick.globalToLocal(new Point(0,0));
		//make joystick background
		this.joyStickBackGround.graphics.beginFill(0xC0C0C0, 0.2);
		this.joyStickBackGround.graphics.drawCircle(25, 25, 50);
		this.joyStickBackGround.scaleX = 2.5;
		this.joyStickBackGround.scaleY = 2.5;

		this.gamePadView.init(this.gamePad, 50, this.thumbStick, this.joyStickBackGround);
		this.gamePadView.x = 80;//(this.joyStickBackGround.width / 2);
		this.gamePadView.y = 340;
	#end
	
		this.gamePad.isCircle = false;
		
	}

	
	override public function update():Void 
	{
		super.update();
		if (this.gamePadView != null)
		{
		this.gamePadView.update();
		}
	}
	
	
	
}