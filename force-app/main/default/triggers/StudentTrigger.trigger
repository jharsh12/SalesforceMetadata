trigger StudentTrigger on Student__c (after update) {
    StudentTriggerHandler studentTriggerHandler = new StudentTriggerHandler(); 
    studentTriggerHandler.UpdateStudentHistory(Trigger.new, Trigger.OldMap);
}