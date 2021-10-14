({
    handleAddItem: function(component, event, helper) {
        var addItm = event.getParam("item");
        helper.createItem(component, addItm);
        
    },

    createItem: function(component, newItem) {
    var action = component.get("c.clickCreateItem");
    action.setParams({
        "item": newItem
    });
    action.setCallback(this, function(response){
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            var items = component.get("v.items");
            items.push(response.getReturnValue());
            component.set("v.items", items);
        }
    });
    $A.enqueueAction(action);
},
    clickCreateItem: function(component, event, helper) {
		
        var validItem = component.find('itemform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        
        
        // ... hint: more error checking here ...

        // If we pass error checking, do some real work
        if(validItem){
            // Create the new expense
            var newItem = component.get("v.newItem");
            console.log("Create Camping Item: " + JSON.stringify(newCamping));
            handleAddItem(component, newItem);
        }
		component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                'Name': '',
                'Quantity__c': 0,
                'Price__c': 0,
                'Packed__c': false});
    }
})