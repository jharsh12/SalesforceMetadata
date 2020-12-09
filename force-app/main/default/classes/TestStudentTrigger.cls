@isTest
private class TestStudentTrigger{
    
    public static Boolean isUpdated(Student_History__c updatedRec) {
        Boolean updated = true;
         if(updatedRec.Field_Name__c == 'name') {
            if(updatedRec.Old_Value__c != 'Nikhil' || updatedRec.New_Value__c != 'Anish') {
                updated = false;
            }
        }
        if(updatedRec.Field_Name__c == 'city__c') {
            if(updatedRec.Old_Value__c != 'Noida' || updatedRec.New_Value__c != 'Anish') {
                updated = false;
            }
        }
        if(updatedRec.Field_Name__c == 'state__c') {
            if(updatedRec.Old_Value__c != 'UP' || updatedRec.New_Value__c != 'MAHARASHTRA') {
                updated = false;
            }
        }
        if(updatedRec.Field_Name__c == 'class__c') {
            if(updatedRec.Old_Value__c != 'BTECH' || updatedRec.New_Value__c != 'MTECH') {
                updated = false;
            }
       }
        return updated;
    }
    
    @isTest static void TestUpdateStudentHistory() {
        String initialName = 'Nikhil';
        String initialCity = 'Noida';
        String initialState = 'UP';
        String initialClass = 'BTECH';
          
    	Student__c student = new Student__c(Name = initialName, City__c = initialCity, Class__c = initialClass, State__c = initialState);
        insert student;
        
        Student__c studentInserted = [SELECT Id, Name, City__c, Class__c, State__c FROM  Student__c WHERE Id = :student.Id ];
        studentInserted.Name = 'Anish';
        studentInserted.City__c = 'Pune';
        studentInserted.Class__c = 'MTECH';
		studentInserted.State__c = 'MAHARASHTRA';
        Database.SaveResult result =  Database.update(student);
        System.assert(result.isSuccess(), true);
        
        List<Student_History__c> updatedRecords = [SELECT Id, Field_Name__c, New_Value__c, Old_Value__c, Record_Id__c
                                                   FROM  Student_History__c WHERE Id = :student.Id]; 
        
        for(Student_History__c updatedRecord : updatedRecords) {
            System.assert(isUpdated(updatedRecord) ,true);
        }
        
    }
}