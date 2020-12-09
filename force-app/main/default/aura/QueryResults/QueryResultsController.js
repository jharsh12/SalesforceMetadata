({
	QueryResults : function(component, event, helper) {
        let query = event.getParam("query");
        console.log("QueryResults- - - -" + query);
        //component.set( "v.selectedFields", component.get("v.selectedFieldsSave"));
        helper.QueryResult(component, query[0] );
	},
    
    /*SelectedFieldsGet : function(component, event, helper) {
        console.log("displaying fields");
        var objectSelected = event.getParam('selectedObject');
        console.log();
        component.get("v.selectedFields", objectSelected);
    },*/
    updateQuery : function(component, event, helper) {
        var result = event.getParam("textQuery");
        console.log(result);
        var res = result.split(";");
        result=[];
        for (let i = 0; i < res.length; i++) {
            console.log(res[i]);
            result.push(" " + res[i]);
        }
        component.set ("v.selectedFieldsSave", result);
        console.log(result);
    }
})