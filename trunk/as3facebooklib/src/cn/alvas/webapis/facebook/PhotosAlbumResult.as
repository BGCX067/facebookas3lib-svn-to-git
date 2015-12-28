package cn.alvas.webapis.facebook{
	import cn.alvas.webapis.facebook.Album;
	
	
	public class PhotosAlbumResult{
		
		private var albumsArray : Array;
		/**
		 * <album>
		 *     <aid>34595963571485</aid>
		 *     <cover_pid>34595991612812</cover_pid>
		 *     <owner>8055</owner>
		 *     <name>Films you will never see</name>
		 *     <created>1132553109</created>
		 *     <modified>1132553363</modified>
		 *     <description>No I will not make out with you</description>
		 *     <location>York, PA</location>
		 *     <link>http://www.facebook.com/album.php?aid=2002205&id=8055</link>
		 *     <size>30</size>
		 * </album>
		 */ 
		public function PhotosAlbumResult(){			
			albumsArray = new Array();
		}
		
		public function setAlbumXML(xml : XML) : void{
			var xlist : XMLList = xml.children();
			
			for each ( var s:XML in xlist ) {
				trace("s:"+s);
		 		albumsArray.push( new Album(s.children()[0],
		 									s.children()[1],
									 		s.children()[2],
									 		s.children()[3],
									 		s.children()[4],
									 		s.children()[5],
									 		s.children()[6],
									 		s.children()[7],
									 		s.children()[8],
									 		s.children()[9]
		 		));		 		
		 	}
		}
		
		public function getAlbums() : Array{
			return albumsArray;
		}
	}
}