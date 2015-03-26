package coreClasses;



import samples.Sample_LoadingABitmap;
/**
 * ...
 * @author ...
 */


class Core_StateController
{
 public var currentState:Dynamic;

	public function new()
	{
		this.setDefaultState();
	}


	public function setDefaultState():Void
	{
		//this.currentState = new State_Entry();
		this.changeState(new Sample_LoadingABitmap());
	}
	
	public function changeState(incState:Dynamic):Void
	{
		this.currentState = incState;
		trace(this.currentState);
	
	}

	public function update():Void
	{
		trace("control;ler");
		this.currentState.update();
		
	}
}