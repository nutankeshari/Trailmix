public  with sharing class Test2 {
    
    public static void triggerAfterAccountsUpdate(Map<Id,Account> triggerNewMap) {
 
        
        List<Account> gh = new List<Account>();
        Map<Id,Integer> hj = new Map<Id,Integer>();
        for (Contact con : [SELECT Id,MailingCity,AccountId FROM Contact WHERE AccountId IN : triggerNewMap.keySet()]) {
     
 
            Account ac  = triggerNewMap.get(con.AccountId);
                Map<String,Object> jk = (Map<String,Object>)JSON.deserializeUntyped(JSON.serialize(ac));
                for(String str:jk.keyset()){
                    system.debug('====='+str);
                }
        
        
            if (ac.BillingCity != null && ac.BillingCity==con.MailingCity) {
                if(!hj.containskey(ac.Id)){
                hj.put(ac.Id,1);
                }
                else{
                hj.put(ac.Id,hj.get(ac.Id)+1);
                }
                
            }
            
 
        }
      
        for(Id accId:triggerNewMap.keyset()){
            if(hj.containskey(accId)){
                if(triggerNewMap.get(accId).Matchingcity__c != hj.get(accId)){
                    gh.add(new Account(Id=accId,MatchingCity__c=hj.get(accId)));
                }
            }
            else{
                if(triggerNewMap.get(accId).Matchingcity__c != 0){
                    gh.add(new Account(Id=accId,MatchingCity__c=0));
                }
            }
            if(!gh.isEmpty()){
                    update gh;
                }
            }
        
    }
}