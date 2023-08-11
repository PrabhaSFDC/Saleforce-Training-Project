trigger CreateIntegrationLog on Lead (after insert) {

    List <Integration_Log__c> integerationLogs = new List<Integration_Log__c>();
    for(lead currentlead: trigger.new){

    Integration_Log__c log = new Integration_Log__c ();
    log.Request_Body__c = currentlead.FirstName+ currentlead.LastName;
    log.Related_Lead__c = currentlead.Id;
    integerationLogs.add(log);
    }
    Insert integerationLogs;

    }    

    
    /*List<Lead> newLeads = new List<Lead>();
    List<Integration_Log__c> logList = new List<Integration_Log__c>();

    for (Lead newLead : Trigger.new) {
        newLeads.add(newLead);
    }

    if (!newLeads.isEmpty()) {
        ProcessIntegrationData.processAndLogData(newLeads, logList);
    }
    }*/
