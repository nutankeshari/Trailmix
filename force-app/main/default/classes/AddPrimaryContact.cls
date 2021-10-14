public class AddPrimaryContact implements Queueable {
    
    private Contact objCon;
    private String stateStr;
    
    public AddPrimaryContact(Contact objCon, String stateStr) {
        this.objCon = objCon;
        this.stateStr = stateStr;
    }

    public void execute(QueueableContext context) {
        List<Account> lstAcc = [SELECT Id, BillingState  FROM Account WHERE BillingState =: stateStr limit 200];
        
        if(lstAcc != null && lstAcc.size() > 0)
        {
            List<Contact> lstCon = new List<Contact>();
            
            for(Account objAcc : lstAcc){
                Contact objNewCon = objCon.clone();
                objNewCon.AccountId = objAcc.Id;
                lstCon.add(objNewCon); 
            }
            insert lstCon;
        }
    }
    
}