@isTest(SeeAllData=false)
private class LeadProcessorTest
{
    static testMethod void validateLeadProcessor()
    {
        Test.startTest();
        List<Lead> lstLeadToInsert = new List<Lead>();
        integer i = 1;
        while(i <= 100){
            Lead objLead = new Lead();
            objLead.lastName = 'test'+i;
            objLead.Company = 'Saasfocus';
            lstLeadToInsert.add(objLead);
            i++;
        }
        insert lstLeadToInsert;
        
        LeadProcessor objBatch = new LeadProcessor();
        Database.executeBatch(objBatch, 200); 
        
        List<Lead> lstLead = [SELECT Id, Name FROM Lead];
        for(Lead obj : lstLead)
            system.debug(obj);
        
        Test.stopTest();
    }
}