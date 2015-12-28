package cn.alvas.webapis.facebook{

	public class AuthSessionResult {
		
		private var session:String;

		public function AuthSessionResult() {
		}	

		public function getSession():String {
			return session;
		}
		
		public function setSession( value:String ):void {
			session = value;
		}
		
		public function toString() : String{
			return "{AuthSessionResult:[session:"+session+"]}";
		}
	}
	
}