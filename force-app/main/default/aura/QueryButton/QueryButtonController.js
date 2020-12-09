({
	callQuery : function(component, event, helper) {
		console.log(component.get("v.objectSelected") +component.get("v.query"))
        //var selectCmp = component.find("InputSelectMultiple");
        //var resultCmp = component.find("multiResult");
        
        let query = component.get("v.query");
        //resultCmp.set("v.value", selectedFields);
        console.log("call query"+query);
        let queryButtonClickHandler = $A.get("e.c:QueryButtonClickHandler");

        queryButtonClickHandler.setParams({ "query": query });

        console.log("fire event");

        console.log(query);
        queryButtonClickHandler.fire();
	},
    
    syncObject : function(component, event, helper) {
        var result = event.getParam("selectedObject");
        component.set("v.objectSelected", result);
        console.log('result '+result);
        // var res = result.split(";");
        // result=[];
        // for (let i = 0; i < res.length; i++) {
        //     console.log(res[i]);
        //     result.push(res[i]);
        // }
        // component.set("v.query","SELECT "+ result+" FROM "+"ObjectName");
        // console.log(result);
    },
    
     updateQuery : function(component, event, helper) {
        var result = event.getParam("textQuery");
        console.log(result);
        var res = result.split(";");
        result=[];
        for (let i = 0; i < res.length; i++) {
            console.log(res[i]);
            result.push(" " + res[i]);
        }
        let objectname = component.get("v.objectSelected");
        component.set ("v.query","SELECT"+ result+" FROM "+ objectname);
        console.log(result);
    },

    
    
})