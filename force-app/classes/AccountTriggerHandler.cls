public class AccountTriggerHandler extends TriggerHandler {
    public AccountTriggerHandler() {
        //this.setMaxLoopCount(1);
    }
    public override void afterInsert() {
        /* List<Contact> lstNewContact = new List<Contact>();
        for(Account objAccount : (List<Account>)trigger.new){
            Contact objCon = new Contact();            
            objCon.LastName = 'NutaaVaruu';
            
            lstNewContact.add(objCon);
        }  
        //TriggerHandler.bypass('ContactTriggerHandler');
        insert lstNewContact; */
        //TriggerHandler.clearBypass('ContactTriggerHandler');

    }
}