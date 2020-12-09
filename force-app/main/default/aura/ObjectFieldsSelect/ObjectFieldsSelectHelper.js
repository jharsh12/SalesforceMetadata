({
	getFieldsData : function(component, objectSelected) {
		let objSelected = objectSelected;
        console.log("getFields set" +objectSelected);
        var action = component.get("c.getFields");
        action.setParams({
            "objectAPI": objSelected
        });
        action.setCallback(this, function (response) {

            if (response.getState() == "SUCCESS") {
                console.log("recieved fields");
                console.log(response.getReturnValue());
                component.set("v.optionsFields", response.getReturnValue());
            }
            else {
                console.log(response.getState());
            }
        })

        $A.enqueueAction(action);
        console.log(component.get("v.optionsFields"));
	}
})