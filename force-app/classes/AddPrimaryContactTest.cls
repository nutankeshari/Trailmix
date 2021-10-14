@isTest(SeeAllData=false)
private class AddPrimaryContactTest
{
    static testMethod void validateAddPrimaryContact()
    {
        Test.startTest();
        
        List<Account> lstAccToInsert = new List<Account>();
        integer i = 1;
        while(i <= 50){
            Account objAcc = new Account();
            objAcc.Name = 'test'+i;
            objAcc.BillingState  = 'NY';
            lstAccToInsert.add(objAcc);
            i++;
        }
        while(i <= 100){
            Account objAcc = new Account();
            objAcc.Name = 'test'+i;
            objAcc.BillingState = 'CA';
            lstAccToInsert.add(objAcc);
            i++;
        }
        insert lstAccToInsert;
        
        Contact objCon = new Contact();
        objCon.lastName = 'Con';
        objCon.Email = 'nutan@gmail.com';
        insert objCon;
        
        AddPrimaryContact objCls = new AddPrimaryContact(objCon, 'CA');
        ID jobID = System.enqueueJob(objCls);

        Test.stopTest();
    }
}