trigger caseTrigger on Case (before update) {

    
   if(trigger.isUpdate && trigger.isBefore && 
   caseTriggerHandler.TransationCount <= 1){
   //!caseTriggerHandler.isTriggerUpdate){
        map<Id, case> oldMap = trigger.oldMap;
        caseTriggerHandler.isTriggerUpdate = True;
        caseTriggerHandler.TransationCount +=1;
        for(case obj : trigger.New){
            if(oldMap.containsKey(obj.Id) && oldMap.get(obj.Id).Status != obj.Status
                && obj.Status == 'Approved') {
                //obj.OwnerId = '0057F000004CoqM';    
                obj.Status = 'Working';   
            } 
            system.debug(':::::::::::'+obj.Status);
        }
    }
}