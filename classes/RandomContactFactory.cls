Public class RandomContactFactory {

    Public static List<Contact> generateRandomContacts (Integer Nb, String Name) {
        List<Contact> cons = new LIST<Contact>();
        
        
        for (Integer i=0;i<Nb;i++) {
            cons.add(New Contact(LastName=Name, FirstName='Test '+i));
        }
        
        return cons;
    }

}