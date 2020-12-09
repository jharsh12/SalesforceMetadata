public class TeacherController {   
    List<Teacher__c> results = [select Name from Teacher__c];
    public List<Teacher__c> getresults() {   
        return results;  
    }
}