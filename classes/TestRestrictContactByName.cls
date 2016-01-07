@isTest
private class TestRestrictContactByName {
    @isTest static void TestRestrictContactByName() {
    
        Contact con = New Contact (LastName = 'INVALIDNAME');
        try {
            Insert con;
        } catch (DmlException Dmle) {}
        
        Boolean ConIdIsNull = (con.id==null);
        
        System.assertEquals(ConIdIsNull,true);
        
        Contact con2 = New Contact (LastName = 'VALIDNAME');
        try {
            Insert con2;
        } catch (DmlException Dmle) {}
        
        
        Boolean Con2IdIsNull = (con2.id==null);
        
        System.assertEquals(Con2IdIsNull ,false);

    }
}