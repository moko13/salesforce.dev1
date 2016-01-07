Public class AccountHandler {

    public static Account insertNewAccount (String SName) {
        try {
            Account Acc = new Account(Name = SName);
            Database.insert(Acc);
            return Acc;
        } catch (DmlException DmlE) {
            return null;
        }
    
    }

}