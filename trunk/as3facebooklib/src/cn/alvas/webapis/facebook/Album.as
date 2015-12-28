package cn.alvas.webapis.facebook
{
	public class Album{
				
		private var aid : String;
 		private var cover_pid : String;
 		private var owner : String;
 		private var name : String;
 		private var created : String;
 		private var createdDate : Date;
 		private var modified : String;
 		private var modifiedDate : Date;
 		private var description : String;
 		private var location : String;
 		private var link : String;
 		private var size : String;
 		
 		public function Album(aid : String, cover_pid : String, owner : String,
 		                      name : String, created : String, modified : String,
 		                      description : String, location : String, link : String, size : String){
 			this.aid = aid;
	 		this.cover_pid = cover_pid;
	 		this.owner = owner;
	 		this.name = name;
	 		this.setCreated(created);
	 		this.setModified(modified);
	 		this.description = description;
	 		this.location = location;
	 		this.link = link;
	 		this.size = size;
 		}
 		
 		public function getAid() : String{
 			return aid;
 		}
 		
 		public function setAid(aid : String) : void{
 			this.aid = aid;
 		}
 		
 		public function getCoverPid() : String{
 			return cover_pid;
 		}
 		
 		public function setCoverPid(cover_pid : String) : void{
 			this.cover_pid = cover_pid;
 		}
 		
 		public function getOwner() : String{
 			return owner;
 		}
 		
 		public function setOwner(owner : String) : void{
 			this.owner = owner;
 		}
 		
 		public function getName() : String{
 			return name;
 		}
 		
 		public function setName(name : String) : void{
 			this.name = name;
 		}
 		
 		public function getCreated() : String{
 			return created;
 		}
 		
 		public function setCreated(created : String) : void{
 			this.created = created;
 			createdDate = new Date();
 			createdDate.setTime(parseInt(created)*1000);
 		}
 		
 		public function getModified() : String{
 			return modified;
 		}
 		
 		public function setModified(modified : String) : void{
 			this.modified = modified;
 			modifiedDate = new Date();
 			modifiedDate.setTime(parseInt(modified)*1000);
 		}
 		
 		public function getDescription() : String{
 			return description;
 		}
 		
 		public function setDescription(description : String) : void{
 			this.description = description;
 		}
 		
 		public function getLocation() : String{
 			return location;
 		}
 		
 		public function setLocation(location : String) : void{
 			this.location = location;
 		}
 		
 		public function getLink() : String{
 			return link;
 		}
 		
 		public function setLink(link : String) : void{
 			this.link = link;
 		}
 		
 		public function getSize() : String{
 			return size;
 		}
 		
 		public function setSize(size : String) : void{
 			this.size = size;
 		}
 		
 		public function toString() : String{ 			
 			return "{Album:[aid:"+aid+"][cover_pid:"+cover_pid+"]" + 
 					"[owner:"+owner+"][name:"+name+"][created:"+createdDate.toLocaleString()+"]" + 
 					"[modified:"+modifiedDate.toLocaleString()+"][description:"+description+"]" + 
 					"[location:"+location+"][link:"+link+"][size:"+size+"]}";
 		}
	}
}