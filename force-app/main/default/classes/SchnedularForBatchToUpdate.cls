public with sharing class SchnedularForBatchToUpdate implements Schedulable {
    public SchnedularForBatchToUpdate() {

    }
    public void execute(SchedulableContext context)
    {

        Database.executeBatch(new AccountAndContactRandomNumber(),2);
    }
}