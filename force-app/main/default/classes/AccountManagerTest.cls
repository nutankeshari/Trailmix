@isTest(SeeAllData=False)
Private Class AccountManagerTest{

Static testMethod void method1(){
Account acc = new Account(Name='X');
insert Acc;
Contact con = new contact(Lastname='Y',Email='test@gmail.com',accountId=Acc.Id);
insert con;
Restrequest request = new RestRequest();
request.requesturi='https://varunarora-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+Acc.Id+'/contacts';
request.httpMethod='GET';
Restcontext.request=request;
Test.startTest();
AccountManager.getAccount();
Test.stopTest();
}

}