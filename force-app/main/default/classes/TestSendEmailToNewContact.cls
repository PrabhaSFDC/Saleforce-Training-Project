@istest
public with sharing class TestSendEmailToNewContact {
    
    @isTest
    static void testEmailSentToNewContact() {
        // Create test data for the contact
        Contact testContact = new Contact(
            FirstName = 'Prabhakaran',
            LastName = 'ContactPalani',
            Email = 'alwar.newt@gmail.com'
        );

        // Ensure there are no existing contacts with the test email address
        Contact[] existingContacts = [SELECT Id FROM Contact WHERE Email = :testContact.Email];
        System.assertEquals(0, existingContacts.size(), 'A contact with the test email already exists.');

        // Insert the test contact
        Test.startTest();
        insert testContact;
        Test.stopTest();

        // Verify that the contact was inserted successfully
        Contact insertedContact = [SELECT Id, Email FROM Contact WHERE Id = :testContact.Id];
        System.assertEquals('testcontact@test.com', insertedContact.Email, 'Contact email not saved correctly.');

        // Verify that the email was sent
        List<Messaging.SingleEmailMessage> sentEmails = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{});
        System.assertEquals(1, sentEmails.size(), 'Email not sent to the new contact.');
        System.assertEquals('testcontact@test.com', sentEmails[0].getToAddresses()[0], 'Email sent to the wrong address.');
        System.assertEquals('Welcome to Our Company!', sentEmails[0].getSubject(), 'Email subject incorrect.');
        System.assertEquals(true, sentEmails[0].getPlainTextBody().contains('Dear Test,'), 'Email body incorrect.');
    }
}