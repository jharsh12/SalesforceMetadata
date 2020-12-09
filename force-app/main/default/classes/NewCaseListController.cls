public class NewCaseListController {    
    public List<Case> getNewCases() {        
        List<Case> results = Database.query(
            'SELECT Id, CaseNumber, Account.name ' +
            'FROM Case '
        );
        return results;  
    }    
}