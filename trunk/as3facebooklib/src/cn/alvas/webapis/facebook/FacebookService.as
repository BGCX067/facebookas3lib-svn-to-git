package cn.alvas.webapis.facebook{
	import flash.net.URLLoader;
	import flash.events.EventDispatcher;
	import cn.alvas.webapis.facebook.methodgroups.Auth;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.ProgressEvent;
	import cn.alvas.webapis.facebook.methodgroups.Photos;	
	/**
	 * The FacebookService class abstracts the Facebook API found
	 * at http://www.flickr.com/services/api/
	 */
	public class FacebookService extends EventDispatcher {
		
		/**
		 * The REST endpoint where we can talk with Facebook service
		 */
		public static const REST:String = "http://api.facebook.com/restserver.php";	

		/** 
		 * Store the API key that gives developers access to the Flickr service 
		 */
		private var api_key:String;
		
		/**
		 * The "shared secret" of your application for authentication
		 */
		private var secret:String;
		
		/**
		 * The token identifying the user as logged in
		 */
		private var token:String;
		
		private var session : String;
		
		private var v : String;
		
		private var format : String;
		
		//--
		
		private var auth : Auth;
		private var photos : Photos;
		
		public function FacebookService( api_key:String, v:String="1.0", format:String="XML" ) {
			this.api_key = api_key;
			this.v = v;
			this.format = format;
			auth = new Auth( this );	
			photos = new Photos( this );
		}

		public function getApikey():String {
			return api_key;	
		}

		public function setApikey( value:String ):void {
			api_key = value;	
		}
		
		public function getSecret():String {
			return secret;	
		}

		public function setSecret( value:String ):void {
			secret = value;	
		}
		
		public function getV():String {
			return v;	
		}

		public function setV( value:String ):void {
			v = value;	
		}
		
		public function getFormat():String {
			return format;	
		}

		public function setFormat( value:String ):void {
			format = value;	
		}
		
		public function getToken():String {
			return token;	
		}

		public function setToken( value:String ):void {
			token = value;	
		}
		
		public function getSession():String {
			return session;	
		}

		public function setSession( value:String ):void {
			session = value;	
		}
		
		public function getURLLoader():URLLoader{
			var loader:URLLoader = new URLLoader();
			loader.addEventListener("progress", onProgress);
			loader.addEventListener("ioError", onIOError);
			loader.addEventListener("securityError", onSecurityError);			
			return loader;			
		}
		
		private function onIOError(event:IOErrorEvent):void{
			dispatchEvent(event);
		}	
		
		private function onSecurityError(event:SecurityErrorEvent):void{
			dispatchEvent(event);
		}
		
		private function onProgress(event:ProgressEvent):void{
			dispatchEvent(event);
		}
		
		public function getAuth():Auth {
			return auth;	
		}

		public function setAuth( value:Auth ):void {
			auth = value;	
		}
		
		public function getPhotos():Photos {
			return photos;	
		}

		public function setPhotos( value:Photos ):void {
			photos = value;	
		}
		
	}
	
}
