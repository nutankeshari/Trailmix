public class ContactTriggerHandler extends TriggerHandler {
    public override void afterInsert() {
        List<Account> lstNewAccount = new List<Account>();
        for(Contact objContact : (List<Contact>)trigger.new){
            Account objAcc = new Account();            
            objAcc.Name = 'NutaaVaruu';
            
            lstNewAccount.add(objAcc);
        }
        //TriggerHandler.bypass('AccountTriggerHandler');
        insert lstNewAccount; 
        //TriggerHandler.clearBypass('AccountTriggerHandler'); 
    }    
}