package cn.alvas.webapis.facebook{
	/**
	 * @author Alva Sun 
	 *
	 */ 
	public class NameValuePair{
		
		private var _name:String;
		private var _value:String;

		public function NameValuePair( name:String = "", value:String = "" ) {
			_name = name;
			_value = value;
		}

		public function get name():String {
			return _name;
		}

		public function set name( value:String ):void {
			_name = value;
		}

		public function get value():String {
			return _value;
		}

		public function set value( v:String ):void {
			_value = v;
		}
		
		public function toString() : String{
			return _name+(_name == ""? "":"=" )+_value;
		}
	}
}