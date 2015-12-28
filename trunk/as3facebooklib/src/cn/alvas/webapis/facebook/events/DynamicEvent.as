package cn.alvas.webapis.facebook.events{
	
	import flash.events.Event;
	
	/**
	* Event class that contains data loaded from remote services.
	*
	* @author Alva Sun
	*/
	public class DynamicEvent extends Event{
		
		protected var data:Object;
		
		public function DynamicEvent(type:String, bubbles:Boolean = false, 
									 cancelable:Boolean=false, data:Object=null){
			this.data = data;
			super(type, bubbles, cancelable);
		}
		
		public function getParamObject():Object{
			return data;
		}
		
		public function setParamObject(o : Object):void{
			data = o;
		}
			
		override public function clone():Event{
			return new DynamicEvent(type, bubbles, cancelable, data);
		}
	}
}