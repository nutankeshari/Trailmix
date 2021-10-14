({
    onFormSubmit : function(component, event, helper) {
        var formData = event.getParam("formData");
        var boatTypeId = formData.boatTypeId;
        var boatSearchResCmp = component.find("boatSearchResId");
        var auraMethodResult = boatSearchResCmp.search(boatTypeId);
    }
})