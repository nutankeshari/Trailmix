({
	search : function(component, event, helper) {
        debugger;
		var eventResult = event.getParam('arguments');
        component.set("v.boatTypeId",eventResult.boatId);
        helper.onSearch(component);
	},
    doSearch : function(component, event, helper){
        helper.onSearch(component);
    },
    onBoatSelect : function(component, event, helper){
        debugger;
        var boatselectId = event.getParam("boatId");
        component.set("v.selectedBoatId",boatselectId);
    }
})