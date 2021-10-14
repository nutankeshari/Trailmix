public class AccountProcessor{

    @Future
    public static void countContacts(List<Id> lstAccountIds){
        if(lstAccountIds != null && lstAccountIds.size() > 0){
            Set<Id> setAccIds  = new Set<Id>();
            setAccIds.addAll(lstAccountIds);
            
            List<Account> lstAcc = [SELECT Id, Name, Number_of_Contacts__c, (SELECT Id from Contacts) FROM Account Where ID In : setAccIds];
            List<Account> lstAccToUpdate  = new List<Account>();
            if(lstAcc != null && setAccIds.size() > 0){
                for(Account objAcc : lstAcc){
                    if(objAcc.contacts != null && objAcc.Contacts.size() > 0){
                        objAcc.Number_of_Contacts__c = objAcc.Contacts.size(); 
                        lstAccToUpdate.add(objAcc);
                    }
                }
                if(lstAccToUpdate.size() > 0)
                    update lstAccToUpdate;
            }
        }
    
    }
}