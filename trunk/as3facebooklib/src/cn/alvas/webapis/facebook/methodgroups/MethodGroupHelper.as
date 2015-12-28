package cn.alvas.webapis.facebook.methodgroups{
	import cn.alvas.webapis.facebook.FacebookError;
	import cn.alvas.webapis.facebook.FacebookService;
	import cn.alvas.webapis.facebook.NameValuePair;
	import cn.alvas.webapis.facebook.events.FacebookResultEvent;
	
	import flash.xml.XMLNode;
	import cn.alvas.webapis.facebook.utils.MD5;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import cn.alvas.webapis.facebook.AuthTokenResult;
	import cn.alvas.webapis.facebook.AuthSessionResult;
	import cn.alvas.webapis.facebook.PhotosAlbumResult;
	import cn.alvas.webapis.facebook.Album;
	
	
	/**
	 * Contains helper functions for the method group classes that are
	 * reused throughout them.
	 * 
	 * @author Alva Sun
	 */
	internal class MethodGroupHelper	{
		
		internal static var callID : int = 0;
		
		internal static function invokeMethod( service:FacebookService, 
												callBack:Function, method:String, 
												signed:Boolean = true, ... params:Array ):void{
			
			var args:Array = new Array();
			
			args.push( new NameValuePair( "api_key", service.getApikey() ) );
			args.push( new NameValuePair( "method", method ) );
			args.push( new NameValuePair( "v", service.getV() ) );
			args.push( new NameValuePair( "format", service.getFormat() ) );
			var call_id : String = ( (new Date()).valueOf() ).toString() + ( ++callID ).toString();
			args.push( new NameValuePair( "call_id", call_id ) );
			var session_key : String = service.getSession();
			if(session_key != null && session_key.length == 34) args.push( new NameValuePair( "session_key", session_key ) );
			
			// Loop over the params and add them as arguments
			for ( var i:int = 0; i < params.length; i++ ) {
				// Do we have an argument name, or do we create one
				if ( params[i] is NameValuePair ) {
					args.push( params[i] );
				}
			}

			if ( signed ) {
				args.sortOn( "name" );
				var sig:String = "";
				for ( var j:int = 0; j < args.length; j++ ) {
					sig += (args[j] as NameValuePair).toString();
				}
				sig += service.getSecret();	
				trace("sig: MD5: "+sig);
				args.push( new NameValuePair( "sig", MD5.hash( sig ) ) );
			}
			
			var variables:URLVariables = new URLVariables();
			var nvp : NameValuePair;
			for ( var k:int = 0; k < args.length; k++ ) {
				nvp = (args[k] as NameValuePair);
				if(nvp != null && nvp.name.length>0 ){
					variables[nvp.name] = nvp.value;
				}
			}

			var request:URLRequest = new URLRequest(FacebookService.REST);
			request.data = variables;
			request.method = URLRequestMethod.POST;			

			var loader:URLLoader = service.getURLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener( "complete", callBack );
			loader.load(request);
		}
		
		internal static function processAndDispatch( service:FacebookService, response:String, result:FacebookResultEvent, propertyName:String = "", parseFunction:Function = null ):void {
			// Process the response to create an object for return values
			var rsp:Object = processResponse( response, propertyName, parseFunction );
			result.setParamObject(rsp);

			// Notify everyone listening
			service.dispatchEvent( result );
		}
		
		/**
		 * 
		 *@return An object with 'success' and 'data' properties.  
		 * 		success  will be true if the call was completed, false otherwise.
		 *		data     will contain ether an array of NameValuePair 
		 * 				(if successful) or errorCode and errorMessage properties.
		 */ 
		internal static function processResponse( facebookResponse:String, propertyName:String, parseFunction:Function ):Object {
			var result:Object = new Object();
			result.data = new Object();
			
			XML.ignoreWhitespace = true;
			var doc:XML = new XML(facebookResponse);
			trace("out doc:--------------------\n"+doc);
			if ( doc.localName() == "error_response" || doc.children()[0].localName() == "fb_error") {
				//error response
				result.success = false;
				var ecode : int = -1;
				var emessage : String = doc;
				var error:FacebookError = new FacebookError();
				
				if ( doc.children().length() > 0 && doc.children()[0].localName() == "fb_error"){
					var xlist : XMLList = doc.children()[0];
					ecode = parseInt(xlist.children()[0]);
					emessage = xlist.children()[1];
				}else{
					ecode = doc.children()[0];
					ecode = doc.children()[1]
				}				
				
				error.setErrorCode(doc.children()[0]);
				error.setErrorMessage(doc.children()[1]);
				result.data.error = error;
			}else{
				//right response
				result.success = true;
				
				if ( parseFunction == null ) {
					result.data = doc;
				} else {
					result.data[propertyName] = parseFunction( doc );	
				}
			}
			return result;		
		}
		
		internal static function parseAuthTokenResult( xml:XML ):AuthTokenResult {
			var authTokenResult:AuthTokenResult = new AuthTokenResult();
			authTokenResult.setToken(xml.children()[0]);
			return authTokenResult;
		}
		
		internal static function parseAuthSessionResult( xml:XML ):AuthSessionResult {
			var authSessionResult:AuthSessionResult = new AuthSessionResult();
			authSessionResult.setSession(xml.children()[0]);
			return authSessionResult;
		}
		
		internal static function parsePhotosGetAlbumsResult( xml:XML ):PhotosAlbumResult{
			var photosAlbumResult:PhotosAlbumResult = new PhotosAlbumResult();
			photosAlbumResult.setAlbumXML(xml);
			return photosAlbumResult;
		}
		
		internal static function parsePhotosCreateAlbumResult( xml:XML ):Album{
			var album:Album = new Album(xml.children()[0],
		 									xml.children()[1],
									 		xml.children()[2],
									 		xml.children()[3],
									 		xml.children()[4],
									 		xml.children()[5],
									 		xml.children()[6],
									 		xml.children()[7],
									 		xml.children()[8],
									 		xml.children()[9]);
			return album;
		}	
		
	}
}