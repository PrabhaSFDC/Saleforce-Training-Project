public class DeleteTestLeadsScheduler implements Schedulable {
    public void execute(SchedulableContext sc) {
        // Query and delete leads with "Test" in the name
        List<Lead> leadsToDelete = [SELECT Id, Name FROM Lead WHERE Name LIKE '%Test%' LIMIT 300];
        List<Id> leadIdsToDelete = new List<Id>();

        for (Lead lead : leadsToDelete) {
            leadIdsToDelete.add(lead.Id);
        }

        if (!leadIdsToDelete.isEmpty()) {
            // Delete leads
            Database.DeleteResult[] deleteResults = Database.delete(leadIdsToDelete, false);

            // Notify admins about the operation
            String emailBody = 'Deleted ' + deleteResults.size() + ' test leads.\n';

            for (Database.DeleteResult result : deleteResults) {
                if (result.isSuccess()) {
                    emailBody += 'Lead deleted: ' + result.getId() + '\n';
                } else {
                    emailBody += 'Failed to delete lead with ID ' + result.getId() + ': ' + result.getErrors()[0].getMessage() + '\n';
                }
            }

            // Send email notification to all admins
            List<User> admins = [SELECT Id, Email FROM User WHERE Profile.Name = 'System Administrator'];
            List<String> adminEmails = new List<String>();

            for (User admin : admins) {
                adminEmails.add(admin.Email);
            }

            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(adminEmails);
            mail.setSubject('Test Leads Deletion Report');
            mail.setPlainTextBody(emailBody);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}
