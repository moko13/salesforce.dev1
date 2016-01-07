public class ContactSearch {

    public static List<Contact> searchForContacts (String LastName, String MailingPostalCode) {

        Contact[] cons = [SELECT Id,LastName FROM Contact WHERE LastName =:LastName AND MailingPostalCode =: MailingPostalCode];
    
        return cons;
    }

}