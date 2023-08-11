public with sharing class OpportunityAutoNameHelpter {
    public static void autoNameCreation(List<Opportunity> opportunities)

     {
        For(Opportunity newOpportunity: opportunities){

            Datetime closeDateField = newOpportunity.CloseDate;

            String monthName = closeDateField.format('MMMMM');

            newOpportunity.Name = newOpportunity.Account.Name +' '+monthName+' '+newOpportunity.StageName;

        }

    }
}