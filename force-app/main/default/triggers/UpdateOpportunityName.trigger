trigger UpdateOpportunityName on SOBJECT (before insert) {
    for (Opportunity opp : Trigger.new) {
        // Check if the Opportunity's Account, CloseDate, and StageName are populated
        if (opp.AccountId != null && opp.CloseDate != null && opp.StageName != null) {
            String accountName = opp.Account.Name;
            String monthName = opp.CloseDate.format('MMMM');
            String stageName = opp.StageName;

            // Concatenate the name components as desired
            String opportunityName = accountName + ' - ' + monthName + ' - ' + stageName;
            
            // Limit the name to 120 characters (Opportunity name field length limit)
            if (opportunityName.length() > 120) {
                opportunityName = opportunityName.substring(0, 120);
            }
                
            // Set the calculated name for the Opportunity
            opp.Name = opportunityName;
        }
    }
}