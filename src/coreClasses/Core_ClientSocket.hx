package coreClasses;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.filesystem.StorageVolumeInfo;
import openfl.Lib;
import qookie.net.Socket;
import openfl.events.Event;
import qookie.net.SocketEvent;
import openfl.events.ProgressEvent;

/*
 * ...
 * @author Samuel Weeks
 */

class Core_ClientSocket extends Sprite 
{

	var connection:Socket;
	var icon:Bitmap;
	public function new() 
	{
		super();
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
		
		//this.startConnection();
		
	}
	
	public function startConnection(incServerIpAddress:String,incPort:Int):Void
	{
		trace("trying to connect");
		
		this.connection = new Socket();
		connection.addEventListener(SocketEvent.CONNECT, onConnect);
		connection.addEventListener(SocketEvent.CLOSE, onClose);
		connection.addEventListener(SocketEvent.IO_ERROR, onError);
		connection.addEventListener(SocketEvent.SOCKET_DATA, onData);
		this.connection.connect(incServerIpAddress, incPort);
		
		
		
	}
	
	public function onMessage(e:ProgressEvent):Void
	{
		if (this.connection.bytesAvailable > 0)
		{
			trace(this.connection.readUTFBytes(this.connection.bytesAvailable));
		}
		trace("testing---got data?");
	}
	
	public function onConnect(e:SocketEvent):Void
	{
		trace("connected");
		this.connection.writeUTFBytes("hey you!!!!!");
	}
	
	public function onData(e:SocketEvent):Void
	{
		
		while (this.connection.bytesAvailable > 0)
		{
			trace("testing---got data");
			trace(this.connection.readUTFBytes(this.connection.bytesAvailable));
		}
	}
	
	public function onClose(e:SocketEvent):Void
	{
		trace("testing--- closing");
	}
	
	public function onError(e:SocketEvent):Void
	{
		trace("testing---error");
	}
	
	public function update():Void
	{
		

	}
		
	
	
}

