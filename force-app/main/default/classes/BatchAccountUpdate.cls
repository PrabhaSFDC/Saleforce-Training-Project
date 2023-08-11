public with sharing class BatchUpdateAccount implements Database.Batchable<Account>{

    public BatchUpdateAccount() {}
    public Database.QueryLocator start(Database.BatchableContext context){
    String accountsToupdate ='SELECT id, Is_Updated__c from Account WHERE isupdate_c = false';
    return Database.getQueryLocator(accountsToUpdate);

    }

public void execute(Database.BatchableContext context , List<Account>accountsToupdate){
    for(Account accountsToupdate : (List<Account>)accountsToupdate)
    }
public void finish(Database.BatchableContext context){

    }

}
// -------
// -------
// -------
// -------
// -------
// -------
// -------
// -------