package cn.alvas.webapis.facebook{

	public class AuthTokenResult {
		
		private var token:String;

		public function AuthTokenResult() {
		}	

		public function getToken():String {
			return token;
		}
		
		public function setToken( value:String ):void {
			token = value;
		}
		
		public function toString() : String{
			return "{AuthTokenResult:[toke:"+token+"]}";
		}
	}
	
}