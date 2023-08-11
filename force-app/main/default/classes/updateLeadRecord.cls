public with sharing class updateLeadRecord {
    
    public static Boolean identifyTestLeads() {

        List<Lead> leadsToUpdate = new List<Lead>();
        
        // Query all Leads with "Test" in the Name field
        for (Lead lead : [SELECT Id, Name, Is_Test_Record__c FROM Lead WHERE Name LIKE '%Test%']) {
            lead.Is_Test_Record__c = true; // Set the checkbox to true
            leadsToUpdate.add(lead);
        }
        
        // Update Leads with the checkbox checked
        if (!leadsToUpdate.isEmpty()) {
            update leadsToUpdate;
        }
        return true;
    }
}