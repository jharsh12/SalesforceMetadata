public class SalesforceMetadata {
            
@AuraEnabled
    public static Map<String, String> getObjects() {

        Map<String, String> objectsMap = new Map<String, String>();
        for(Schema.SObjectType objectItem : Schema.getGlobalDescribe().Values()) {
            objectsMap.put(objectItem.getDescribe().getLabel(), objectItem.getDescribe().getName());
            //System.debug('Desc'  + String.valueOf(objTyp.getDescribe()) + 'Label: ' + String.valueOf( objTyp.getDescribe().getLabel()));
        }
        System.debug(String.valueOf(objectsMap));
        return objectsMap;
    }
    
    
}