trigger SendEmailToNewContact on Contact (before insert) {
    List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

    for (Contact newContact : Trigger.new) {
        // Check if the contact has an email address
        if (newContact.Email != null) {
            // Create a new email message
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

            // Set the recipient email address
        email.setToAddresses(new List<String>{newContact.Email});

            // Set the email subject and body
        email.setSubject('Welcome to Our Company - 4iApps Solution.!');
        email.setPlainTextBody('Dear ' + newContact.LastName + ',\n\nWelcome to our 4iApps Solution, Thanks for showing interested in our Product. Our Customer care team will reach you Shortly!\n\nBest regards,\n4iApps Solutions');

            // Add the email message to the list
        emailList.add(email);
        }
    }

    // Send the email messages
    if (!emailList.isEmpty()) {
        Messaging.sendEmail(emailList);
    }

}