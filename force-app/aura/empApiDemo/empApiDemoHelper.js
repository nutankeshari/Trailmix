({
	initialise : function(component,event,helper) {
		 var onsucccessCallback = function(successs) {
               alert('EMP API subscribe karo');
            
             component.find('empApi').subscribe('/event/Test__e', -1, function(eventdata){alert(eventdata);}).then(function(value) {
            console.log("Subscribed to channel");
            component.set("v.subscription", value);
        });
            }
         this.initializeEmpApi(component,onsucccessCallback);
	},
    initializeEmpApi: function(component, onsucccessCallback) {
    console.log('initializing EMP API');
   if (this.empApiInitialized) {
        console.log('EMP API already initialized');
        onsucccessCallback(component);
    }
     
        // Get the empApi cmp
        var empApi = component.find('empApi');

//        var helperRef = this;
        empApi.isEmpEnabled().then(function(enabled) {
            if (!enabled) {
                alert('cmp must be hosted in the Salesforce One app in order to listen to platform events');
                return;
            }
            console.log('EMP API is enabled');
            empApi.setDebugFlag(true);

            var onErrorCallback = function(error) {
                console.error('EMP API message: ' + JSON.stringify(error));
            }.bind(this);
            empApi.onError(onErrorCallback);
			onsucccessCallback(component);
           
        });

}}
)