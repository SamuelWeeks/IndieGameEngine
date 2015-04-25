package;
import coreClasses.Core_Text;
import coreClasses.GameController;
import openfl.display.MovieClip;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

/**
 * ...
 * @author Samuel Weeks
 */
class Phase_ServerSelect extends GamePhase
{

	public var text_EnterIpAddress:Core_Text;
	public var textInput_serverIpAddress:Core_Text = new Core_Text(Core_Text.blackFont,100,0,.4,"ipAddress..");
	public var textInput_ServerPort:Core_Text = new Core_Text(Core_Text.whiteFont, 100, 40,.4, "Enter port number of Server");
	public var text_ServerPortInput:Core_Text = new Core_Text(Core_Text.whiteFont, 100, 80, .4, "serverport....");
	public var background:MovieClip = new Ast_GuiServerConnect();
	
	public var Step:String;
	
	public function new() 
	{
		super();
		//place text--------------
		//ipaddress
		//this.text_EnterIpAddress = new Core_Text(Core_Text.font_Default);
		/*this.textInput_serverIpAddress = new Core_Text(Core_Text.font_Default, 100, 40,"");
		//serverport--
		this.text_EnterServerPort = new Core_Text(Core_Text.font_Default, 100, 80, "enter server port");
		this.textInput_ServerPort = new Core_Text(Core_Text.font_Default, 100, 120, "type ipAddress here");
		//ADD THEM TO THE BACKGROUND
		IGE.layer_GameWindow.addChild(text_EnterIpAddress.textField);
		IGE.layer_GameWindow.addChild(textInput_serverIpAddress.textField);
		IGE.layer_GameWindow.addChild(text_EnterServerPort.textField);*/
		/*this.serverIptextInput.textField.x = this.textPositionX;
		this.serverIptextInput.textField.y = this.textPositionY;
		this.background.addChild(serverIptextInput.textField);
		this.serverIptextInput.textField.text = "hahahahaha";*/
	}
	
	override public function enterPhase():Void 
	{
		super.enterPhase();
		IGE.layer_GameWindow.addChild(this.background);
		this.background.addChild(this.textInput_serverIpAddress.textField);
		this.background.addChild(this.textInput_ServerPort.textField);
		this.background.addChild(this.text_ServerPortInput.textField);
		
		this.Step = "enterIp";

	}
	
	override public function exitPhase():Void 
	{
		super.exitPhase();
		IGE.layer_GameWindow.removeChild(this.background);
	}
	
	override public function btnTyped(incBtn:KeyboardEvent):Void 
	{
		if (this.Step == "enterIp")
		{
			switch(incBtn.keyCode)
				{
					case Keyboard.NUMBER_0:this.textInput_serverIpAddress.textField.text += "0";
					case Keyboard.NUMBER_1:this.textInput_serverIpAddress.textField.text += "1";
					case Keyboard.NUMBER_2:this.textInput_serverIpAddress.textField.text += "2";
					case Keyboard.NUMBER_3:this.textInput_serverIpAddress.textField.text += "3";
					case Keyboard.NUMBER_4:this.textInput_serverIpAddress.textField.text += "4";
					case Keyboard.NUMBER_5:this.textInput_serverIpAddress.textField.text += "5";
					case Keyboard.NUMBER_6:this.textInput_serverIpAddress.textField.text += "6";
					case Keyboard.NUMBER_7:this.textInput_serverIpAddress.textField.text += "7";
					case Keyboard.NUMBER_8:this.textInput_serverIpAddress.textField.text += "8";
					case Keyboard.NUMBER_9:this.textInput_serverIpAddress.textField.text += "9";
					//
					case Keyboard.PERIOD:this.textInput_serverIpAddress.textField.text += ".";
					case Keyboard.BACKSPACE:this.textInput_serverIpAddress.textField.text = "";
					//case Keyboard.ENTER:IGE.coreSocket.startConnection(this.textInput_serverIpAddress.textField.text,10000);
					case Keyboard.ENTER:this.Step = "enterPort";
				}
		}
		if (this.Step == "enterPort")
		{
			switch(incBtn.keyCode)
				{
					case Keyboard.NUMBER_0:this.textInput_ServerPort.textField.text += "0";
					case Keyboard.NUMBER_1:this.textInput_ServerPort.textField.text += "1";
					case Keyboard.NUMBER_2:this.textInput_ServerPort.textField.text += "2";
					case Keyboard.NUMBER_3:this.textInput_ServerPort.textField.text += "3";
					case Keyboard.NUMBER_4:this.textInput_ServerPort.textField.text += "4";
					case Keyboard.NUMBER_5:this.textInput_ServerPort.textField.text += "5";
					case Keyboard.NUMBER_6:this.textInput_ServerPort.textField.text += "6";
					case Keyboard.NUMBER_7:this.textInput_ServerPort.textField.text += "7";
					case Keyboard.NUMBER_8:this.textInput_ServerPort.textField.text += "8";
					case Keyboard.NUMBER_9:this.textInput_ServerPort.textField.text += "9";
					//
					case Keyboard.PERIOD:this.textInput_ServerPort.textField.text += ".";
					case Keyboard.BACKSPACE:this.textInput_ServerPort.textField.text = "";
					//case Keyboard.ENTER:IGE.coreSocket.startConnection(this.textInput_serverIpAddress.textField.text,10000);
					//case Keyboard.ENTER:this.Step = "enterPort";
				}
			
		}

		
	}
	
	
	
	
	

	
	override public function update():Void 
	{
		super.update();
		BraggingRights.camera.thumbStickDirectionMove(5);
		
	}

}