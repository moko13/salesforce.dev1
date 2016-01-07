public class ContactAndLeadSearch {

    public static List<List<SObject>> searchContactsAndLeads (String Name) {
       List<List<SObject>> searchList = [FIND :Name IN ALL FIELDS RETURNING Contact(LastName), Lead(LastName)];
       return searchList;
    }

}