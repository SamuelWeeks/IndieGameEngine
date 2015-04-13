package coreClasses;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;

/**
 * ...
 * @author ...
 */
@:keepSub class Core_Player
{

	public var playerName:String;
	
	public var btnUp:UInt;  //up
	public var btnDown:UInt;	//down
	public var btnLeft:UInt;	//left
	public var btnRight:UInt;	//right
	public var btn1:UInt;
	public var btn2:UInt;
	public var btn3:UInt;
	public var btn4:UInt;
	
	public var btnUpPressed:Bool = false;
	public var btnDownPressed:Bool = false;
	public var btnLeftPressed:Bool = false;
	public var btnRightPressed:Bool = false;
	public var btn1Pressed:Bool = false;
	public var btn2Pressed:Bool = false;
	public var btn3Pressed:Bool = false;
	public var btn4Pressed:Bool = false;
	
	
	public function new(incPlayerName:String,incBtnUp:String,incBtnDown:String,incbtnLeft:String,incbtnRight:String,incBtn1:String,incBtn2:String,incBtn3:String,incBtn4:String) 
	{
		this.playerName = incPlayerName;
		
		this.btnUp = convertToKeyCode(incBtnUp);//incButton1;
		this.btnDown = convertToKeyCode(incBtnDown);//incButton2;
		this.btnLeft = convertToKeyCode(incbtnLeft);//incbtnLeft;
		this.btnRight = convertToKeyCode(incbtnRight);//incbtnRight;
		this.btn1 = convertToKeyCode(incBtn1);//incbutton1;
		this.btn2 = convertToKeyCode(incBtn2);//incbutton1;
		this.btn3 = convertToKeyCode(incBtn3);//incbutton1;
		this.btn4 = convertToKeyCode(incBtn4);//incbutton1;
		
		this.setButtonsPressedToFalse();
		this.addToUpdateGroup();
	}
	
	/*public function configInputs(incPlayerName:String,incButton1:String,incButton2:String,incbtnLeft:String,incbtnRight:String,incButton5:String):Void
	{
		this.playerName = incPlayerName;
		
		this.button1 = convertToKeyCode(incButton1);//incButton1;
		this.button2 = convertToKeyCode(incButton2);//incButton2;
		this.btnLeft = convertToKeyCode(incbtnLeft);//incbtnLeft;
		this.btnRight = convertToKeyCode(incbtnRight);//incbtnRight;
		this.button5 = convertToKeyCode(incButton5);//incbutton5;
	}*/
	
	private function convertToKeyCode(incButtonString:String):Int
	{
		var theKeyCode:Int;
		theKeyCode = 1;
		switch(incButtonString)
		{
			case "A": theKeyCode = Keyboard.A;
			case "C": theKeyCode = Keyboard.C;
			case "D": theKeyCode = Keyboard.D;
			case "F": theKeyCode = Keyboard.F;
			case "W": theKeyCode = Keyboard.W;
			case "X": theKeyCode = Keyboard.X;
			case "Z":theKeyCode = Keyboard.Z;
			case "V":theKeyCode = Keyboard.V;
			case "S": theKeyCode = Keyboard.S;
			case "num1": theKeyCode = Keyboard.NUMPAD_1;
			case "num2": theKeyCode = Keyboard.NUMPAD_2;
			case "num3": theKeyCode = Keyboard.NUMPAD_3;
			case "num4": theKeyCode = Keyboard.NUMPAD_4;
			case "num5": theKeyCode = Keyboard.NUMPAD_5;
			case "num6": theKeyCode = Keyboard.NUMPAD_6;
			case "num7": theKeyCode = Keyboard.NUMPAD_7;
			case "num8": theKeyCode = Keyboard.NUMPAD_8;
			case "num9": theKeyCode = Keyboard.NUMPAD_9;
			case "Space": theKeyCode = Keyboard.SPACE;
		}
		return(theKeyCode);
		
	}
	
	public function setButtonsPressedToFalse():Void
	{
		this.btnUpPressed = false;
		this.btnDownPressed = false;
		this.btnLeftPressed = false;
		this.btnRightPressed = false;
		this.btn1Pressed = false;
		this.btn2Pressed = false;
		this.btn3Pressed = false;
		this.btn4Pressed = false;
	}
	public function addToUpdateGroup():Void
	{
		IGE.updateGroup.push(this);
		this.setButtonsPressedToFalse();
	}
	
	public inline function inputActionPressed(inc_Input:KeyboardEvent):Void 
	{
			//BtnUp-------------------------------------------------
			if (inc_Input.keyCode == btnUp)
				{
					if (this.btnUpPressed == false)
					{
						this.btnUpPressed = true;
						IGE.coreState.playerBtnTapped(this.playerName, "btnUp");
					}
				}
			//BtnDown---------------------------------------------------
			if (inc_Input.keyCode == btnDown)
				{
					if (this.btnDownPressed == false)
					{
						this.btnDownPressed = true;
						IGE.coreState.playerBtnTapped(this.playerName, "btnDown");
					}
				}
			//btnLeft-----------------------------------------------
			if (inc_Input.keyCode == btnLeft)
				{
					if (this.btnLeftPressed == false)
					{
						this.btnLeftPressed = true;
						IGE.coreState.playerBtnTapped(this.playerName, "btnLeft");
					}
				}
			//btnRight-----------------------------------------------
			if (inc_Input.keyCode == btnRight)
				{
					if (this.btnRightPressed == false)
					{
						this.btnRightPressed = true;
						IGE.coreState.playerBtnTapped(this.playerName, "btnRight");
					}
				}
			//Button1-----------------------------------------------
			if (inc_Input.keyCode == btn1)
				{
					if (this.btn1Pressed == false)
					{
						this.btn1Pressed = true;
						IGE.coreState.playerBtnTapped(this.playerName, "btn1");
					}
				}
				//Button2-----------------------------------------------
			if (inc_Input.keyCode == btn2)
				{
					if (this.btn2Pressed == false)
					{
						this.btn2Pressed = true;
						IGE.coreState.playerBtnTapped(this.playerName, "btn2");
					}
				}
				//Button3-----------------------------------------------
			if (inc_Input.keyCode == btn3)
				{
					if (this.btn3Pressed == false)
					{
						this.btn3Pressed = true;
						IGE.coreState.playerBtnTapped(this.playerName, "btn3");
					}
				}
				//Button4-----------------------------------------------
			if (inc_Input.keyCode == btn4)
				{
					if (this.btn4Pressed == false)
					{
						this.btn4Pressed = true;
						IGE.coreState.playerBtnTapped(this.playerName, "btn4");
					}
				}
	}
	
	public inline function inputActionReleased(inc_Input:KeyboardEvent):Void 
	{
				
			//BtnUp-------------------------------------------------
			if (inc_Input.keyCode == btnUp)
				{
					this.btnUpPressed = false;
					IGE.coreState.playerBtnUnTapped(this.playerName, "btnUp");
				}
			//BtnDown---------------------------------------------------
			if (inc_Input.keyCode == btnDown)
				{
					this.btnDownPressed = false;
					IGE.coreState.playerBtnUnTapped(this.playerName, "btnDown");
				}
			//btnLeft-----------------------------------------------
			if (inc_Input.keyCode == btnLeft)
				{
					this.btnLeftPressed = false;
					IGE.coreState.playerBtnUnTapped(this.playerName, "btnLeft");
				}
			//btnRight-----------------------------------------------
			if (inc_Input.keyCode == btnRight)
				{
					this.btnRightPressed = false;
					IGE.coreState.playerBtnUnTapped(this.playerName, "btnRight");
				}
			//Button1-----------------------------------------------
			if (inc_Input.keyCode == btn1)
				{
					this.btn1Pressed = false;
					IGE.coreState.playerBtnUnTapped(this.playerName, "btn1");
				}
				//Button2-----------------------------------------------
			if (inc_Input.keyCode == btn2)
				{
					this.btn2Pressed = false;
					IGE.coreState.playerBtnUnTapped(this.playerName, "btn2");
				}
				//Button3-----------------------------------------------
			if (inc_Input.keyCode == btn3)
				{
					this.btn3Pressed = false;
					IGE.coreState.playerBtnUnTapped(this.playerName, "btn3");
				}
				//Button4-----------------------------------------------
			if (inc_Input.keyCode == btn4)
				{
					this.btn4Pressed = false;
					IGE.coreState.playerBtnUnTapped(this.playerName, "btn4");
				}
	}

	public inline function update():Void
	{

	}
	
	
	
}