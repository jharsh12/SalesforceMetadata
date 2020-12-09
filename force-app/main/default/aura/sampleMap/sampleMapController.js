({
    fetchMapCtrl: function(component, event, helper) {
        
        var action = component.get('c.getObjects');
        action.setCallback(this, function(response) {
            
            var state = response.getState();
            if (state === "SUCCESS") {
                
                var arrayOfMapKeys = [];
                
                var objectsMap = response.getReturnValue();
                //console.log('StoredResponse' + objectsMap);
                
                component.set('v.fullMap', objectsMap);
                
                for (var singlekey in objectsMap) {
                    arrayOfMapKeys.push(singlekey);
                }
                
                component.set('v.lstKey', arrayOfMapKeys);
            }
        });
        
        $A.enqueueAction(action);
    },
    
    showFields : function(component, event, helper) {
        
        let selectedObject = event.getSource().get("v.value");
        console.log(selectedObject);
        
        //let newItem = component.get("v.newItem");
        
        let displayFieldsEvent = $A.get("e.c:DisplayFieldsEvent");
        
        displayFieldsEvent.setParams({ "selectedObject": selectedObject });
        
        console.log("fire event");
        
        displayFieldsEvent.fire();
        
        //helper.displayField(component.get("v."));
    }
})