public with sharing class ContactWithRelatedLead {

    public static void relateContactToLead(Id contactId, Id leadId) {

        // Query the contact and lead records
        
        Contact contactRecord = [SELECT Id, Email, AccountId FROM Contact WHERE Id = :contactId];

        Lead leadRecord = [SELECT Id, Email FROM Lead WHERE Id = :leadId];

        // Check if both contact and lead have emails

        if (contactRecord.Email != null && leadRecord.Email != null) {

            // Check if the emails match

            if (contactRecord.Email == leadRecord.Email) {

                // Relate the contact to the lead

                contactRecord.AccountId = leadId;

                update contactRecord;
                System.debug('asynchronous');
            }

        }

    }

}