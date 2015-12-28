package cn.alvas.webapis.facebook{

	public class FacebookError {
		
		/**
		 * ErrorCodes   ErrorMessage
		 *	1 		An unknown error occurred. Please resubmit the request.
		 *	2 		The service is not available at this time.
		 *	4 		The application has reached the maximum number of requests allowed. More requests are allowed once the time window has completed.
		 *	5 		The request came from a remote address not allowed by this application.
		 *	100 	One of the parameters specified was missing or invalid.
		 *	101 	The api key submitted is not associated with any known application.
		 *	102 	The session key was improperly submitted or has reached its timeout. Direct the user to log in again to obtain another key.
		 *	103 	The submitted call_id was not greater than the previous call_id for this session.
		 *	104 	Incorrect signature.
		 */ 
		public static const UNKNOWN_ERROR               :int = 1;
		public static const SERVICE_UNAVAILABLE         :int = 2;
		public static const MAX_REQUESTS                :int = 4;
		public static const REQUEST_NOT_ALLOWED         :int = 5;
		public static const INVALID_OR_MISS_PARAMETERS  :int = 100;
		public static const UNKNOWN_APIKEY              :int = 101;
		public static const INVALID_SESSIONKEY          :int = 102;
		public static const TOOOLD_CALLID               :int = 103;
		public static const INCORRECT_SIGNATURE         :int = 104;
		

		
		private var errorCode:int;
		private var errorMessage:String;

		public function FacebookError() {
			// do nothing	
		}

		public function getErrorCode():int {
			return errorCode;	
		}
		
		public function setErrorCode( value:int ):void {
			errorCode = value;	
		}
		
		public function getErrorMessage():String {
			return errorMessage;	
		}
		
		public function setErrorMessage( value:String ):void {
			errorMessage = value;	
		}
		
	}	
	
}
    