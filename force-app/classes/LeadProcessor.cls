global class LeadProcessor implements Database.Batchable<sObject>
{
     global Database.QueryLocator start(Database.BatchableContext BC)
     {
           return Database.getQueryLocator([SELECT Id, LeadSource FROM Lead]);
     }
    global void execute(Database.BatchableContext BC, List<Lead> lstLead)
    {
        if(lstLead != null && lstLead.size() > 0)    
        {
            List<Lead> lstLeadToUpdate = new List<Lead>();
            
            for(Lead objLead : lstLead){
                objLead.LeadSource = 'Dreamforce';
                lstLeadToUpdate.add(objLead);            
            }
            update lstLeadToUpdate;
        }
    }
    global void finish(Database.BatchableContext BC){
   }
}