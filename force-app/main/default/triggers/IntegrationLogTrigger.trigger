trigger IntegrationLogTrigger on Integration_Log__c(after insert) {

    for(Integration_Log__c log: trigger.new){
    System.enqueueJob(new ProcessIntegerationData (log.Id));
    }
}