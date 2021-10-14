({
	doInit : function(component, event, helper) {
		//alert(component.getLocalId());	
	},
    
    myChangeHandler : function(component, event, helper) {
     	alert(event.getParam("rating"));   
    }
})