package cn.alvas.webapis.facebook.utils{

	/**
	 * add parameters to method
	 * 
	 * @author Alva Sun
	 */
	public class Delegate{

		public static function create(method:Function, ...additionalArgs):Function{
			return createWithArgs(method, additionalArgs);
		}
	
		private static function createWithArgs(func:Function, args:Array):Function{
			var f:Function = function():*{
				var func0:Function = arguments.callee.func;
	            var parameters:Array = arguments.concat(args);
				return func0.apply(null, parameters);
			};
			
			f["func"] = func;
	
			return f;
		}
	}
}