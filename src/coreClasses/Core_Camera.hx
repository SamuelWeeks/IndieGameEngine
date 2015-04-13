package coreClasses;

/**
 * ...
 * @author ...
 */
class Core_Camera 
{
	
	public var followObect:Core_GameObject;
	public var oldPosX:Float = 0;
	public var oldPosY:Float = 0;
	public var diffX:Float = 0;
	public var diffY:Float = 0;
	public function new() 
	{
		
	}
	public function setDefaultPosistion():Void
	{
		
	}
	
	public function setFollowObject(incObject:Core_GameObject):Void
	{
		if (this.followObect == null)
		{
			this.diffX = (IGE.base_WindowWidth/2)*IGE.scaleAmount;
			this.diffY = (-IGE.base_WindowHeight/2)*IGE.scaleAmount;
			this.panX();
			this.panY();
			this.followObect = incObject;
			this.centerCameraOnFollowObject();
			this.oldPosX = incObject.sceneObject.info.x;
			this.oldPosY = incObject.sceneObject.info.y;
		}
		if (this.followObect != null)
		{
			this.followObect = incObject;
		}
		
		
		
	}
	
	public function centerCameraOnFollowObject():Void
	{
		this.diffX = -this.followObect.sceneObject.info.x*IGE.scaleAmount;
		this.diffY = -this.followObect.sceneObject.info.y*IGE.scaleAmount;
		this.panX();
		this.panY();
	}
	
	public function moveCamera():Void
	{
		
		if (this.followObect.sceneObject != null)
		{
			//x camera movement---------------------
			if (this.oldPosX != this.followObect.sceneObject.info.x)
			{
				if (this.oldPosX < this.followObect.sceneObject.info.x)
				{
					this.diffX = (this.oldPosX - this.followObect.sceneObject.info.x)*IGE.scaleAmount;
					this.panX();
					this.oldPosX = this.followObect.sceneObject.info.x;
				}
				if (this.oldPosX > this.followObect.sceneObject.info.x)
				{
					this.diffX = (this.oldPosX - this.followObect.sceneObject.info.x)*IGE.scaleAmount;
					this.panX();
					this.oldPosX = this.followObect.sceneObject.info.x;
				}
			}
			//y camera movement---------------------
			if (this.oldPosY != this.followObect.sceneObject.info.y)
			{
				if (this.oldPosY < this.followObect.sceneObject.info.y)
				{
					this.diffY = (this.oldPosY - this.followObect.sceneObject.info.y)*IGE.scaleAmount;
					this.panY();
					this.oldPosY = this.followObect.sceneObject.info.y;
				}
				if (this.oldPosY > this.followObect.sceneObject.info.y)
				{
					this.diffY = (this.oldPosY - this.followObect.sceneObject.info.y)*IGE.scaleAmount;
					this.panY();
					this.oldPosY = this.followObect.sceneObject.info.y;
				}
			}
		}
	}
	
	private function panX():Void
	{
		//pan x
		IGE.layer_Spriter.x += this.diffX;
		IGE.layer_GameWindow.x += this.diffX;
		#if flash
		IGE.debug_PhysicsDisplay.x += this.diffX;
		#end
	}
	private function panY():Void
	{
		//pan y
		IGE.layer_Spriter.y -= this.diffY;
		IGE.layer_GameWindow.y -= this.diffY;
		#if flash
		IGE.debug_PhysicsDisplay.y -= this.diffY;
		#end
	}
	
	public function update():Void
	{
		this.moveCamera();
	}
	
}