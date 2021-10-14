({
    doInit : function(component, event, helper) {
        debugger;
        var action = component.get("c.getInitValue");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                component.set("v.lstOptions",response.getReturnValue());
                var createRec = $A.get('e.force:createRecord');
                if (createRec) {
                    component.set('v.showNewButton', true);
                }
                
            }
        });
        $A.enqueueAction(action);
    },
    createBoat : function(component, event){
        var selectedValue = component.get("v.selectedValue");
        var createRec = $A.get('e.force:createRecord');
        if(createRec && selectedValue != null && selectedValue != undefined && selectedValue != ''){
            createRec.setParams({
                "entityApiName": "Boat__c",
                "defaultFieldValues": {
                    "BoatType__c": selectedValue
                }
            });
            createRec.fire();
        }
            
    },
    onFormSubmit : function(component, event){
        debugger;
       	var varSelected = component.get("v.selectedValue");
        var formSubmit = component.getEvent("formsubmit");
        formSubmit.setParams({"formData":
                            {"boatTypeId" : varSelected}
        });
          formSubmit.fire();  
    }
})