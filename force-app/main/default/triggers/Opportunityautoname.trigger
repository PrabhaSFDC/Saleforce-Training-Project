trigger Opportunityautoname on Opportunity (before insert, before update) {
    Set<Id> accountIds = new Set<Id>();
    for (Opportunity opp : Trigger.new) {

        if (opp.AccountId != null && opp.CloseDate != null) {

            accountIds.add(opp.AccountId);
        }
    }

    Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Name FROM Account WHERE Id IN :accountIds]);
    for (Opportunity opp : Trigger.new) {
        if (opp.AccountId != null && opp.CloseDate != null) {

            String monthName = opp.CloseDate.month().format();

            opp.Name = accountMap.get(opp.AccountId).Name + ' - ' + monthName + ' - ' + opp.StageName;
        }
    }
}

