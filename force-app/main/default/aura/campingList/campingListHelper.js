({
    validateItemForm: function(component) 
    {
        // Simplistic error checking
        var validItem = true;

        // Name must not be blank
        var nameField = component.find("itemname");
        var itemname = nameField.get("v.value");
        
        if($A.util.isEmpty(itemname))
        {
            validItem = false;
            nameField.set("v.errors", [{message:"Item name can't be blank."}]);
        }
        else 
        {
            nameField.set("v.errors", null);
        }
        
        // Price must not be blank
        var priceField = component.find("price");
        var pricename = priceField.get("v.value");
        
        if($A.util.isEmpty(pricename))
        {
            validItem = false;
            priceField.set("v.errors", [{message:"Price can't be blank."}]);
        }
        else 
        {
            priceField.set("v.errors", null);
        }
        
        // Quanitiy must not be blank
        var quantityField = component.find("quantity");
        var quantityname = quabtityField.get("v.value");
        
        if($A.util.isEmpty(quantityname))
        {
            validItem = false;
            quantityField.set("v.errors", [{message:"Quantity can't be blank."}]);
        }
        else 
        {
            quantityField.set("v.errors", null);
        }
        
        return(validItem);
    },
	createItem: function(component, item) 
    {
        var action = component.get("c.saveItem");
        action.setParams({
            "item": item
        });
        action.setCallback(this, function(response)
        {
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") 
            {
                var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
            }
        });
        $A.enqueueAction(action);
    }
})