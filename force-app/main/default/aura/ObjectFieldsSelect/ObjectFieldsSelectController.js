({
    doInit : function(cmp) {
        // Initialize input select options
        
    },
    
    displayFields : function(component, event, helper) {
        console.log("displaying fields");
        var objectSelected = event.getParam('selectedObject');
        console.log("objectSelected"+objectSelected);
        helper.getFieldsData(component, objectSelected);
    },
    
    selectFields :  function(component, event, helper) {
        console.log("displaying fields");
        let selectedFields = component.find("InputSelectMultiple").get(v.value);
        console.log('-->'+selectedFields);
        
    },
    
    onMultiSelectChange: function(component) {
        var selectCmp = component.find("InputSelectMultiple");
        //var resultCmp = component.find("multiResult");
        
        let selectedFields = selectCmp.get("v.value");
        //resultCmp.set("v.value", selectedFields);
        
        let updateQueryEvent = $A.get("e.c:UpdateQueryBox");

        updateQueryEvent.setParams({ "textQuery": selectedFields });

        console.log("fire event");

        console.log('-->'+selectCmp.get("v.value"));
        updateQueryEvent.fire();
    },
})