({
	onBoatClick : function(component, event, helper) {
        debugger;
		var boat = component.get("v.boat");
        var selectedId = boat.Id;
        var boatselect = component.getEvent("boatselect");
        boatselect.setParams({"boatId" : selectedId});
        boatselect.fire();  
        
        var appEvent = $A.get("e.c:BoatSelected");
        appEvent.setParams({ "boat" : boat });
        appEvent.fire();
		
        var createEvent = $A.get("e.c:PlotMapMarker");
        createEvent.setParams({'sObjectId' : boat.id,
                               'lat' : boat.Geolocation__Latitude__s,
                               'long' : boat.Geolocation__Longitude__s,
                               'label' : boat.Name});
        createEvent.fire();
	}
})