@isTest
private class TestRestrictContactByName{
    @isTest static void testInvalidContact(){
        
        Test.startTest();
            try{
            Contact con = new Contact(LastName = 'INVALIDNAME');
            INSERT con;
            }Catch(Exception ex){
                System.assertEquals(ex.getMessage().contains('INVALIDNAME') ? true : false, true);
            }
        Test.stopTest();
    }
}