({
    QueryResult : function(component, query) {
        
        //console.log("query result ==== ");
        
        let queryResultsaction = component.get("c.getQuery");
        
        console.log(query);
        
        queryResultsaction.setParams({ "query": query });
        
        queryResultsaction.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("query records ");
                var queryResults = response.getReturnValue();
                console.log(queryResults[0]);
                let a = []
                for(let i = 0; i < queryResults.length; i++){
                    //a.push(JSON.parse(JSON.stringify(queryResults[i])));
                    a.push(queryResults[i]);
                }

              
                // let b = []
                // for (let i = 0; i < a.length; i++) {
                //     b.push(a[i]);
                // }

                let records = [];

                for (let i = 0; i < a.length; i++) {
                    records.push(Object.values(a[i]));
                }

                //component.set("v.records", b);
                component.set( "v.selectedFields", component.get("v.selectedFieldsSave"));
                  let selectedFields  = component.get("v.selectedFields");

                console.log(selectedFields);
                console.log('a '+a);
                //console.log('b '+b);
                let b=[]
                
                for(let i = 0; i<a.length; i++) {
                  b.push( Object.values(a[i]));
                  console.log('a '+ Object.values(a[i]));
                }
                component.set("v.records", b);
                
            }
            else {
                console.log("query response failed");
            }
        });
        
        $A.enqueueAction(queryResultsaction);
    }
})