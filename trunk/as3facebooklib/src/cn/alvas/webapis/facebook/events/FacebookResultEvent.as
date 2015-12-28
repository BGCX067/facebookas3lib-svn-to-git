package cn.alvas.webapis.facebook.events{
	
	public class FacebookResultEvent extends DynamicEvent{
		
		/** Constant for the authGetToken event type. */
		public static const AUTH_CREATE_TOKEN:String = "authCreateToken";
		public static const AUTH_GET_SEESION:String = "authGetSession";
		
		public static const PHOTOS_GET_ALBUMS:String = "photosGetAlbums";
		public static const PHOTOS_CREATE_ALBUM:String = "photosCreateAlbum";
		
		public function FacebookResultEvent(type:String, bubbles:Boolean = false, 
									 cancelable:Boolean=false, data:Object=null){
			super(type, bubbles, cancelable, data);
		}
		
		public function getSuccess() : Boolean{
			return data.success;
		}
		
		public function getData() : Object{
			return this.data.data;
		}
	}
}