public class MyMapController {
    
    @AuraEnabled
    public static Map<String, String> getObjects() {
        Map<String, String> objectsMap = new Map<String, String>();
        
        
        System.debug(Schema.getGlobalDescribe().Values());
        for(Schema.SObjectType objectItem : Schema.getGlobalDescribe().Values()) {
            objectsMap.put( objectItem.getDescribe().getName(), objectItem.getDescribe().getLabel() );
            
            //System.debug('Desc'  + String.valueOf(objectItem.getDescribe()) + 'Label: ' + String.valueOf( objectItem.getDescribe().getLabel()));
        }
        return objectsMap;
    }
    
    @AuraEnabled
    public static List<String> getFields(String objectAPI) {
        //List<String> objectsMap = new List<String>();
        System.debug(objectAPI);
        SObjectType studentObject = Schema.getGlobalDescribe().get(objectAPI);
        Map<String, Schema.SObjectField> sfields = studentObject.getDescribe().fields.getMap();
        List<String> fields = new List<String>();
        fields.addAll(sfields.keySet());
        System.debug(fields);
        return fields;
    }
    
    @AuraEnabled
    public static List<sObject> getQuery(String query) {
        List<sObject> fieldRecords = new List<sObject>();
        System.debug(query);
        /*SObjectType studentObject = Schema.getGlobalDescribe().get(query);
        Map<String, Schema.SObjectField> sfields = studentObject.getDescribe().fields.getMap();
        List<String> fields = new List<String>();
        fields.addAll(sfields.keySet());
        System.debug(fields);*/
        fieldRecords = Database.query(query);
        //System.debug(String.valueOf(fieldRecords));
        return fieldRecords;
    }
}