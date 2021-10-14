({
	onSearch : function(component, event) {
        debugger;
		var action = component.get("c.getBoats");
        action.setParams({
            "boatTypeId": component.get("v.boatTypeId")
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                component.set("v.boats",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})