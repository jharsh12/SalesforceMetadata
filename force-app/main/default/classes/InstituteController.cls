public class InstituteController {
    
    public List<Mentor__c> mentors{set; get;}
    public List<Student__c> students{set; get;}
    public List<Mentor> mentorsList{set;get;}
    public String selectedMentor{set; get;}
    public Boolean showMentorStatus = false;
    public String selectedInstitute{set; get;}
    public List<Institute__c> institute{set;get;}
    public List<SelectOption> institutesOptions = new List<SelectOption>();
	
    public List<SelectOption> getInstitutes() {
        institute = [SELECT Name FROM Institute__c];
 		institutesOptions.add(new SelectOption('SelectInstitute', 'Select Institute'));
        for ( Institute__c a : institute ) {
            institutesOptions.add(new SelectOption(a.Name, String.valueOf(a.Name)));
        }
        return institutesOptions;
    }

    //public void ShowMentor() {
    //    showMentorStatus = !showMentorStatus;
    //}
   
    public Boolean getShowMentorStatus() {
        return showMentorStatus;
    }
    
    public void SelectInstitute() {
		mentors = [SELECT Name, Designation__c FROM Mentor__c WHERE Institute__r.Name =: selectedInstitute];
        mentorsList=new List<Mentor>();
        for(Mentor__c mentor : mentors) {
            mentorsList.add(new Mentor(mentor.Name, mentor.Designation__c, selectedInstitute));
        }
    }

    public PageReference MentorInstanceCall() {
        for ( Mentor mentor : mentorsList ) {
            if(mentor.name == selectedMentor) {
                students = [SELECT Name, Class__c, City__c, State__c, Mentor__c FROM Student__c WHERE Mentor__r.name=: selectedMentor];
                mentor.selected = true;
            }
        }
        return null;
    }
}