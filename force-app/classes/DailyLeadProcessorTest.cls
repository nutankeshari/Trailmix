@isTest(SeeAllData=false)
private class DailyLeadProcessorTest
{
    static testMethod void validateDailyLeadProcessor()
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
        
        DailyLeadProcessor objBatch = new DailyLeadProcessor();
        String sch = '0 0 23 * * ?'; 
        String jobID = system.schedule('Test Territory Check', sch, objBatch); 
        
        List<Lead> lstLead = [SELECT Id, Name FROM Lead];
        for(Lead obj : lstLead)
            system.debug(obj);
        
        Test.stopTest();
    }
}