trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Task> taskListToInsert = new List<Task>();
    for( Opportunity o: Trigger.New) {
        if (o.StageName =='Closed Won') {
            Task task = new Task();
            task.Subject = 'Follow Up Test Task';
            task.WhatId = o.Id;
            taskListToInsert.add(task) ;
        }
    }
    insert taskListToInsert;
}