package ;
import base.BraggingRights;
import coreClasses.Core_State;
import samples.Sample_LoadingABitmap;

/**
 * ...
 * @author 
 */
class State_Entry extends Core_State
{

	
	public function new() 
	{
		super();
		//Main.coreState = new Sample_LoadingABitmap();
		//Main.coreStateController.changeState(new Sample_LoadingABitmap());
		this.changeStateFlag = true;

	}
	
	override public function update():Void 
	{
		if (this.changeStateFlag == true)
		{
			Main.coreState = new BraggingRights();
		}
	}

	
}