public with sharing class AccountAndContactRandomNumber implements Database.Batchable<sObject> {
    public AccountAndContactRandomNumber() {

    }
    public static Integer generateRandomNumber() {
        return (Integer)Math.floor(Math.random() * 10001);
    }
    public Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'Select Id, Custom_Random_Number__c, (SELECT Id, Custom_Random_Number__c FROM Contacts) from Account';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext BC, List<Account> scope) {
        if (scope.isEmpty()) {
            return;
        }
        Integer randomNumber = generateRandomNumber();
        List<Account> accountsToUpdate = new List<Account>();
        
        for (Account acc : scope) {
            acc.Custom_Random_Number__c = randomNumber;
            accountsToUpdate.add(acc);
        }
    
        update accountsToUpdate;
        
        List<Contact> contactsToUpdate = new List<Contact>();
        
        for (Account acc : scope) {
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.Custom_Random_Number__c = randomNumber;
            contactsToUpdate.add(con);
        }
        
        insert contactsToUpdate;
        System.debug('Generated and stored random number: ' + randomNumber);
    }
    public void finish(Database.BatchableContext BC) {
    }
}
