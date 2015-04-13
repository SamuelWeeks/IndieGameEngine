package coreClasses;
import aze.display.behaviours.TileGroupTransform;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Circle;
import nape.shape.Polygon;
import nape.geom.Ray;
import nape.geom.RayResult;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import spriter.engine.Spriter;
import openfl.Lib;

/**
 * ...
 * @author 
 */
@:keepSub class Core_GameObject
{

	public var PhyBody:Body;
	public var sceneObject:Spriter;
	public var enityName:String;
	public var anim_Base:String = "base";
	public var gameObjName:String;
	public var addedToUpdateGroup:Bool = false;
	//focus target
	public var target:Core_GameObject;
	public var RotateType:String = "normal";
	//stats----
	public var baseMovementSpeed:Float = 2;
	//help--
	public var degreeToRad90:Float = 1.5707963268;
	//roationvars----
	static public var rotate_ToTarget:String = "target";
	static public var rotate_ToThumbStick:String = "thumbStick";
	static public var rotate_Normal:String = "normal";
	static public var rotate_ForwardMovemet:String = "forwardMovement";
	//bodySettings
	static public var body_Static:String = "body_Static";
	static public var body_Dynamic:String = "body_Dynamic";
	static public var body_Kinematic:String = "body_Kinematic";
	static public var bodyShape_Box:String = "box";
	static public var bodyShape_Sphere:String = "sphere";
	public var currenntBodyShape:String;
	//ray---
	public var ray_Line:Ray;
	public var ray_Intersection:Vec2;
	public var ray_Flag:RayResult;
	
	public function new(incObject:DisplayObject,incEnityName:String,incPhyBodyType:String,incPhyBodyShape:String) 
	{
		this.enityName = incEnityName;
		this.currenntBodyShape = incPhyBodyShape;
		//this.configSelf();
		this.setGameObjName();
		this.setSpriterObject(incObject);
		//Main.spriterEngine.addEntity(this.gameObjName, incObject.x, incObject.y);
		//Main.spriterEngine.getEntity(this.gameObjName).playAnimFromEntity(this.enityName, this.anim_Base, this.animationEnd);
		//this.sceneObject = Main.spriterEngine.getEntity(this.gameObjName);
		//this.sceneObject.info.scaleX = incObject.scaleX;
		//this.sceneObject.info.scaleY = incObject.scaleY;
		this.applyRigidBody(incObject, incPhyBodyType, incObject.rotation);
		IGE.gameObjectGroup.push(this);
		this.update();
	}
	
	public function configSelf():Void
	{
		//this.enityName = "greenBox";
		this.currenntBodyShape = Core_GameObject.bodyShape_Box;
	}
	
	public function setSpriterObject(incObject:DisplayObject):Void
	{
		IGE.spriterEngine.addEntity(this.gameObjName, incObject.x, incObject.y);
		IGE.spriterEngine.getEntity(this.gameObjName).playAnimFromEntity(this.enityName, this.anim_Base, this.animationEnd);
		this.sceneObject = IGE.spriterEngine.getEntity(this.gameObjName);
		this.sceneObject.info.scaleX = incObject.scaleX;
		this.sceneObject.info.scaleY = incObject.scaleY;
		if (incObject.scaleX > 1)
		{
		var num:Float = incObject.scaleX;
		trace(num + "kkkkkk");
		}
		if (incObject.scaleY > 1)
		{
		var num2:Float = incObject.scaleX;
		trace(num2 + "kkkkkk");
		}
		
	}
	
	public function setGameObjName():Void
	{
		this.gameObjName = Std.string(IGE.nextGameObjectName);
		IGE.nextGameObjectName += 1;
	}
	
	public function destroySelf():Void
	{
		IGE.spriterEngine.removeEntity(this.gameObjName);
		IGE.corePhysics.bodies.remove(this.PhyBody);
	}
	
	public function applyRigidBody(incObject:DisplayObject,incPhyBodyType:String,incObjectRotation:Dynamic):Void
	{
	
		if (this.currenntBodyShape == Core_GameObject.bodyShape_Box)
		{
			switch(incPhyBodyType)
			{
				case "body_Static":
					{
						this.PhyBody = new Body(BodyType.STATIC);
						this.PhyBody.shapes.add(new Polygon(Polygon.box(incObject.width, incObject.height)));
						this.PhyBody.position.x = incObject.x;
						this.PhyBody.position.y = incObject.y;
						this.PhyBody.rotation =   incObjectRotation * Math.PI / 180;
						this.PhyBody.space = IGE.corePhysics;
						trace(incObject.width);
						trace(incObject.height);
						trace(incObject.rotation);
					}
				case "body_Dynamic":
					{
						this.PhyBody = new Body(BodyType.DYNAMIC);
						this.PhyBody.shapes.add(new Polygon(Polygon.box(incObject.width, incObject.height)));
						this.PhyBody.position.x = incObject.x;
						this.PhyBody.position.y = incObject.y;
						this.PhyBody.rotation =    incObjectRotation * Math.PI / 180;
						this.PhyBody.space = IGE.corePhysics;
					}
				case "body_Kinematic":
					{
						this.PhyBody = new Body(BodyType.KINEMATIC);
						this.PhyBody.shapes.add(new Polygon(Polygon.box(incObject.width, incObject.height)));
						this.PhyBody.position.x = incObject.x;
						this.PhyBody.position.y = incObject.y;
						this.PhyBody.rotation =   incObjectRotation * Math.PI / 180;
						this.PhyBody.space = IGE.corePhysics;
					}
			}
		}
			
		if (this.currenntBodyShape == Core_GameObject.bodyShape_Sphere)
		{
			switch(incPhyBodyType)
			{
				case "body_Static":
					{
						this.PhyBody = new Body(BodyType.STATIC);
						this.PhyBody.shapes.add(new Circle(incObject.width/2));
						this.PhyBody.position.x = incObject.x;
						this.PhyBody.position.y = incObject.y;
						this.PhyBody.rotation =   incObjectRotation * Math.PI / 180;
						this.PhyBody.space = IGE.corePhysics;
						trace(incObject.width);
						trace(incObject.height);
						trace(incObject.rotation);
					}
				case "body_Dynamic":
					{
						this.PhyBody = new Body(BodyType.DYNAMIC);
						this.PhyBody.shapes.add(new Circle(incObject.width/2));
						this.PhyBody.position.x = incObject.x;
						this.PhyBody.position.y = incObject.y;
						this.PhyBody.rotation =    incObjectRotation * Math.PI / 180;
						this.PhyBody.space = IGE.corePhysics;
					}
				case "body_Kinematic":
					{
						this.PhyBody = new Body(BodyType.KINEMATIC);
						this.PhyBody.shapes.add(new Circle(incObject.width/2));
						this.PhyBody.position.x = incObject.x;
						this.PhyBody.position.y = incObject.y;
						this.PhyBody.rotation =   incObjectRotation * Math.PI / 180;
						this.PhyBody.space = IGE.corePhysics;
					}
			}
		}
		
		
	}
	
	public function doAnimation(incAnimationName:String):Void
	{
		this.sceneObject.playAnim(incAnimationName, this.animationEnd);
	}
	
	public function animationEnd(incSpriterObject:Spriter, incEntityName:String, incAnim:String):Void
	{
		trace(this.sceneObject.spriterName);
	}
	
	public function thumbStickDirectionMove(incMovementSpeed:Float):Void
	{
		this.PhyBody.position.x += IGE.coreState.gamePad.x * incMovementSpeed;
		this.PhyBody.position.y += IGE.coreState.gamePad.y * incMovementSpeed;
		
	}
	
	public function forwardVectorMovment(incMovementSpeed:Float):Void
	{
		this.PhyBody.position.x += incMovementSpeed * Math.cos(2 * Math.PI * this.sceneObject.info.angle / 360);
		this.PhyBody.position.y -= incMovementSpeed * Math.sin(2 * Math.PI * this.sceneObject.info.angle / 360);
	}
	
	public function doRayCast(incTargetPosition:Vec2,incDistance:Int):Void
	{
		this.ray_Line = Ray.fromSegment(this.PhyBody.position, incTargetPosition);
		this.ray_Line.maxDistance = incDistance;
		this.ray_Flag = IGE.corePhysics.rayCast(this.ray_Line);
		if(ray_Flag != null)
		{
			trace(ray_Flag.distance+" yes!!!!!!!!!!!!!!!!!!!!!!!!!");
			this.ray_Intersection = this.ray_Line.at(ray_Flag.distance);
		}
		this.ray_Flag = null;
		
		var raySprite:Sprite = new Sprite();
		IGE.layer_GameWindow.addChild(raySprite);
		raySprite.graphics.clear();
		raySprite.graphics.lineStyle(1);
		raySprite.graphics.moveTo(this.PhyBody.position.x, this.PhyBody.position.y);
		raySprite.graphics.lineTo(this.ray_Intersection.x, this.ray_Intersection.y );
	}
	
	public function update():Void
	{
	
			if (this.addedToUpdateGroup == false)
			{
				IGE.updateGroup.push(this);
				this.addedToUpdateGroup = true;
			}
			if (this.sceneObject.info != null)
			{
				this.sceneObject.info.x = this.PhyBody.position.x;
				this.sceneObject.info.y = -this.PhyBody.position.y;
				this.sceneObject.info.angle = -(this.PhyBody.rotation * 180 / Math.PI);
				this.RotateTo(this.RotateType);
			}
	}
	

	public function RotateTo(incRotateType:String):Void
		{
			switch(incRotateType)
			{
				case "target":
					{
						if (this.target != null)
						{
						// get position
						var dx = this.target.PhyBody.position.x - this.PhyBody.position.x;
						var dy = this.target.PhyBody.position.y - this.PhyBody.position.y;
						//get angle
						var angle = Math.atan2(dy, dx);
						var degrees = 360 * (angle / (2 * Math.PI));
						// rotateto
						//this.sceneObject.info.angle = -degrees;
						this.PhyBody.rotation = angle;
						}
					}
				case "normal":
					{
						
					}
					
				case "thumbStick":
					{
						this.PhyBody.rotation = -(IGE.coreState.gamePad.angle) +this.degreeToRad90 ;
					}
				case "forwardMovement":
					{
						this.forwardVectorMovment(this.baseMovementSpeed);
					}
			}
		}

	
	
	

}