public class RandomContactFactory{
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String lastName){
        
        List<Contact> listOfContacts = new List<Contact>();
        
        for (Integer i = 1; i <= numberOfContacts; i++){            
            Contact contact = new Contact(FirstName = 'Test '+i, LastName = lastName);
            listOfContacts.add(contact);
        }
        
        return listOfContacts;
    }
}