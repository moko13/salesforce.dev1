@isTest
private class TestVerifyDate {
    @isTest static void VerifyDate() {
        Date date1 = Date.newInstance(2015, 03, 01);
        Date date2 = Date.newInstance(2015, 05, 01);
        Date date3 = Date.newInstance(2015, 03, 13);
        Date dateCheck = Date.newInstance(2015, 03, 31);
        
        Date result = null;
        
        // Check Date2 < Date1 = False
        result = VerifyDate.CheckDates(date3, date1); 
        System.assertEquals(result,dateCheck);

        // Check Date2 > Date1 + 30 days= False
        result = VerifyDate.CheckDates(date1, date2); 
        System.assertEquals(result,dateCheck);

        // Check Date 1 + 30 days > Date2 > Date1 = true
        result = VerifyDate.CheckDates(date1, date3); 
        System.assertEquals(result,date3);

    }
}