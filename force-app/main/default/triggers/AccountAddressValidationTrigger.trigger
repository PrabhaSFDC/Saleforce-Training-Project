trigger AccountAddressValidationTrigger on Account (after insert, after update) {
    List<Account> accountsToUpdate = new List<Account>();

    for (Account acc : Trigger.new) {

        if (!acc.Address_Validation_Bypass__c) {
            accountsToUpdate.add(acc);
        }
    }

    if (!accountsToUpdate.isEmpty()) {

        for (Account acc : accountsToUpdate) {
            System.enqueueJob(new AddressValidationQueueable(acc));
        }
    }
}
