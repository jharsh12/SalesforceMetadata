public class ContactSearch {
    public static Contact[] searchForContacts(String lastname, String postcode){
        Contact[] contacts = [select Account.Id, Account.Name from Contact 
                         where (Lastname =:lastname and MailingPostalCode =:postcode)];
        Contact cntlist = contacts[0];
        String AccntId=cntlist.Account.Id;
        String AccntName=cntlist.Account.Name;
        return contacts;
    }
        
}