package cn.alvas.webapis.facebook.methodgroups{
	import cn.alvas.webapis.facebook.FacebookService;
	import cn.alvas.webapis.facebook.events.FacebookResultEvent;
	import cn.alvas.webapis.facebook.NameValuePair;
	import flash.events.Event;
	import flash.net.URLLoader;
	
	
	public class Photos{
		
		private var service : FacebookService;
		
		public function Photos( service:FacebookService ) {
			this.service = service;
		}
		
		public function getAlbums(uid : int = -1, aids : String = ""):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( service, getAlbumsResult, 
									"facebook.photos.getAlbums", true, 
									(uid > 0?new NameValuePair("uid", uid+""):new NameValuePair()),
									(aids.length > 0?new NameValuePair("aids", aids):new NameValuePair()) );
		}
		
		private function getAlbumsResult( event:Event ):void {
			// Create an AUTH_GET_TOKEN event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_GET_ALBUMS );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( service, 
												  URLLoader( event.target ).data, 												  
												  result,
												  "getalbums",
												  MethodGroupHelper.parsePhotosGetAlbumsResult );
			
		}
		
		/**
		 *  @param 	name 	The album name.
		 *	@param 	location 	Optional - The album location.
		 *	@param 	description 	Optional - The album description.
		 **/ 
		public function createAlbum(name : String , location : String = "", description : String = ""):void {
			// Let the Helper do the work to invoke the method
			MethodGroupHelper.invokeMethod( service, createAlbumResult, 
									"facebook.photos.createAlbum", true, 
									new NameValuePair("name",name),
									(location.length > 0?new NameValuePair("location", location):new NameValuePair()),
									(description.length > 0?new NameValuePair("description", description):new NameValuePair()) );
		}
		
		private function createAlbumResult( event:Event ):void {
			// Create an AUTH_GET_TOKEN event
			var result:FacebookResultEvent = new FacebookResultEvent( FacebookResultEvent.PHOTOS_CREATE_ALBUM );

			// Have the Helper handle parsing the result from the server - get the data
			// from the URLLoader which correspondes to the result from the API call
			MethodGroupHelper.processAndDispatch( service, 
												  URLLoader( event.target ).data, 												  
												  result,
												  "createalbum",
												  MethodGroupHelper.parsePhotosCreateAlbumResult );
			
		}
	}
}