public class Mentor {
	public Boolean selected{set;get;}
    public String name{set;get;}
    public Id id{set;get;}
    public String designation{set; get;}
    public String institute{set; get;}
    
    public Mentor(String mentorName, String designation, String institute) {
        selected = false;
    	this.name = mentorName; 
        this.designation = designation;
        this.institute = institute;
    }
    
    public Boolean IsSelected() {
        return selected;
    }
    
    public Boolean ChangeStatus() {
        return !selected;
    }
}