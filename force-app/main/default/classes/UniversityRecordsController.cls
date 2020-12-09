public class UniversityRecordsController {
    
    List<SelectOption> lstopt = new List<SelectOption>();
    List<Institute__c> inst = [select name from Institute__c];
    
    public List<Institute__c> getresults() {   
        return inst;  
    }
}