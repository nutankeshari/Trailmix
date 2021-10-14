({
    packItem: function(component, event, helper) 
    {
        var btnClicked = event.getSource();         // the button
        component.set("v.item", btnClicked.get("v.item")); // update our message
        component.set("v.item.Packed__c", true);
        btnClicked.set("disabled", true);
    }
})