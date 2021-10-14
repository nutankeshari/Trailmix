trigger ClosedOpportunityTrigger on Opportunity (After Insert, After Update) {
    List<Task> lstTask = new List<Task>();
    if(Trigger.IsAfter && (Trigger.IsInsert || Trigger.IsUpdate)) {
        for(Opportunity obj : Trigger.New) {
            if(obj.StageName == 'Closed Won')  {
                Task objTask = new Task();
                objTask.Subject = 'Follow Up Test Task';
                objTask.WhatId = obj.Id;
                lstTask.add(objTask);                
            }  
        }
        if(lstTask.size() > 0)
            insert lstTask;
    }
}