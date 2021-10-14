@RestResource(urlMapping='/Accounts/*/contacts')
global Class AccountManager{
@HttpGet
Global static Account getAccount(){

Restrequest request =Restcontext.Request;
String accountId=request.requestURI.substringBetween('Accounts/', '/contacts');

Account acc=[Select id,Name,(Select id,name from Contacts) from Account where Id=:accountId];

return acc;
}

}