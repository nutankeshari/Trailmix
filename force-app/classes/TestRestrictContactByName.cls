@isTest
private class TestRestrictContactByName{
     @isTest static void testVerifyDate() {
         Test.startTest();
         
         Contact objCon = new Contact();
         objCon.lastName = 'INVALIDNAME';
         //Database.Result result = Database.insert(objCon, false);
         Database.SaveResult srList = Database.insert(objCon, false);

         Test.stopTest();
    }
     
}