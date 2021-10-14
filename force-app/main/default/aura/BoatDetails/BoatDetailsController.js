({
	onBoatSelected : function(component, event, helper) {
		var boat = event.getParam("boat");
		component.set("v.id", boat.Id);	
        component.set("v.boat",boat);
        var service = component.find("service");
		service.reloadRecord();
	},
    onRecordUpdated : function(component,event){
        var boat = component.get("v.boat");
        var BoatReviews = component.find("BoatReviews");
        console.log("BoatReviews: " + BoatReviews);
        if(typeof BoatReviews != 'undefined'){
            BoatReviews.refresh();
        }
    },
    onBoatReviewAdded : function(component, event, helper) {
        console.log('Event received');
        component.find("details").set("v.selectedTabId", "boatreviewtab");
    }
})