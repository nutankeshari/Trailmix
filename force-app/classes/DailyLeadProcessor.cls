global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<Lead> lstLead = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = null limit 200];
        
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
    
}