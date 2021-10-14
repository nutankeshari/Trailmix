trigger AccountAddressTrigger on Account (Before Insert, Before Update, After Update) {
    /* if(Trigger.IsBefore && (Trigger.IsInsert || Trigger.IsUpdate)) {
        for(Account objAcc : Trigger.New) {
            if(objAcc.BillingPostalCode != null && objAcc.Match_Billing_Address__c) {
                objAcc.ShippingPostalCode = objAcc.BillingPostalCode;
            }
        }    
    } */
    if(Trigger.IsAfter && Trigger.IsUpdate) {
        //Test2.rescursive=True;
        Test2.triggerAfterAccountsUpdate(Trigger.newMap);
    }
}