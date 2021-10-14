@isTest(SeeAllData=false)
private class AccountProcessorTest
{
    static testMethod void validateAccountProcessor()
    {
        Test.startTest();
        Account objAcc = new Account();
        objAcc.Name = 'Test Acc';
        insert objAcc;
        
        List<Id> lstAccIds = new List<Id>();
        lstAccIds.add(objAcc.Id);
        
        Contact objCon = new Contact();
        objCon.LastName = 'test con';
        objCon.Email = 'nutan.keshari@gmail.com';
        objCon.AccountId = objAcc.Id;
        insert objCon;
        
        AccountProcessor.countContacts(lstAccIds);
        Test.stopTest();
    }
}