({
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
        component.set ("v.query","SELECT"+ result+" FROM "+ objectname +";");
        console.log(result);
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
})