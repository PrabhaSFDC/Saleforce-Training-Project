public  class opportunityhelper implements UtilityHelper {
    public static void Createaccount() {
        Account newAccount = new Account();
            newAccount.Name = 'Test' + generateRandomString();
            insert newAccount;
        System.debug('created account'+ newAccount.Name);
        } 
}