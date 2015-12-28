package cn.alvas.webapis.facebook.methodgroups{
	import cn.alvas.webapis.facebook.FacebookService;
	import flash.net.URLLoader;
	import cn.alvas.webapis.facebook.events.FacebookResultEvent;
	import flash.events.Event;
	import cn.alvas.webapis.facebook.NameValuePair;
	
	[Event(name="authCreateToken", 
			 type="cn.alvas.webapis.facebook.events.FacebookResultEvent")]	
			 
	[Event(name="authGetSession", 
			 type="cn.alvas.webapis.facebook.events.FacebookResultEvent")]	
	
	/**
	 * 1.facebook.auth.createToken
	 *   Creates an auth_token to be passed in as a parameter to login.php 
	 *   and then to facebook.auth.getSession after the user has logged in. 
	 * 
     * 2.facebook.auth.getSession
	 *	 Returns the session key bound to an auth_token 
     *   (as returned by facebook.auth.createToken or in the callback_url).
     * 
	 * @author Alva Sun
	 */
	public class Auth{
		
		private var service : FacebookService;
		
		public function Auth( service:FacebookService ) {
			this.service = service;
		}
		
		public function createToken():void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( service, createTokenResult, 
									"facebook.auth.createToken");
		}
		
		private function createTokenResult( event:Event ):void {
			// Create an AUTH_GET_TOKEN event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.AUTH_CREATE_TOKEN );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( service, 
												  URLLoader( event.target ).data, 
												  result,
												  "token",
												  MethodGroupHelper.parseAuthTokenResult );
			
		}
		
		/**
		 * 
		 *  @param 	api_key 	The application key associated with the calling application.
		 *	@param 	sig 	An MD5 hash of the current request and your secret key, as described in the authentication guide.
		 *	@param 	v 	This must be set to 1.0 to use this version of the API.
		 *	@param 	format 	(Optional) - desired response format. Either "XML" (default) or "JSON".
		 *	@param 	callback 	(Optional) - wrap the response inside a function call. This is primarily to enable cross-domain javascript requests using the <script> tag, sometimes known as "JSONP". This works with both XML and JSON.
		 *	@param 	auth_token 	The token returned by facebook.auth.createToken and passed into login.php
		 * 
		 */ 
		public function getSession(auth_token : String):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( service, getSessionResult, 
									"facebook.auth.getSession", true,
									new NameValuePair("auth_token", auth_token));
		}
		
		private function getSessionResult( event:Event ):void {
			// Create an AUTH_GET_TOKEN event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.AUTH_GET_SEESION );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( service, 
												  URLLoader( event.target ).data, 
												  result,
												  "session",
												  MethodGroupHelper.parseAuthSessionResult );
			
		}
	}
}