({
    loadBoatTypes : function(component) {
        var isEnabled = $A.get("e.force:createRecord");
        console.log(">>>> action.. "+isEnabled);
        var isTrue = $A.util.isEmpty(isEnabled);
        console.log(">>>> isTrue.. "+isTrue);

        var action = component.get("c.getBoatType");
        action.setCallback(this, function (response) {
            if (response.getState() === 'SUCCESS') {
                var opts = new Array();
                var results = response.getReturnValue();
                for(var i=0;i< results.length;i++){
                    opts.push({label: results.Name, value: results.Name});
                }
                opts.push({label: "All Types", value: "All Types", selected: true});
                component.set("v.options", opts);
            }
        });
        $A.enqueueAction(action);

    }
})