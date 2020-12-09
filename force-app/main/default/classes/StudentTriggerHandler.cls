public class StudentTriggerHandler {
		public static Database.SaveResult[] updates;
    	public static List<Student__c> updatedRecs;
    	public static Map<Id,Student__c> oldRecs;
    	
		public void UpdateStudentHistory(List<Student__c> newRecords, Map<Id,Student__c> oldRecordsMap) {
            
			updatedRecs = newRecords;
            oldRecs = oldRecordsMap;
            SObjectType studentObject = Schema.getGlobalDescribe().get('Student__c');
            Map<String,Schema.SObjectField> sfields = studentObject.getDescribe().fields.getMap();
            List<String> fields = new List<String>();
            fields.addAll(sfields.keySet());
            System.debug(fields);
            Student_History__c newRec;
            Student__c oldRec;
            List <Student_History__c> newRecList = new List <Student_History__c>();
            
            for ( Student__c updatedRec : newRecords ) {
        
                oldRec = oldRecordsMap.get(updatedRec.Id); 
                for(String f : fields) { 
                    if( ( f.contains('__c') || f.contains('name') ) &&  oldRec.get(f) != updatedRec.get(f) ) {
                        newRecList.add(new Student_History__c(Field_Name__c = f,
                                                            New_Value__c = String.valueOf(updatedRec.get(f)), 
                                                            Old_Value__c = String.valueOf(oldRec.get(f)),
                                                            Record_Id__c = String.valueOf(oldRec.Id)));	
                    }
                }
            }
              
            System.debug(newRecList); 
           
            updates =  Database.insert(newRecList, false);
        }
}