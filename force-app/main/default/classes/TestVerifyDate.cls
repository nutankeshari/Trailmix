@isTest
private class TestVerifyDate{
     @isTest static void testVerifyDate() {
        VerifyDate.CheckDates(date.today(), date.today().addDays(2));
    }
     @isTest static void testVerifyDate1() {
        VerifyDate.CheckDates(date.today().addDays(2), date.today());
    }
    
}