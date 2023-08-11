trigger LeadNameChangeTrigger on Lead (after update) {
    List<Lead> updatedLeads = new List<Lead>();

    for (Lead newLead : Trigger.new) {
        Lead oldLead = Trigger.oldMap.get(newLead.Id);
        
        if (newLead.Name != oldLead.Name) {
            LeadNameChangeLogger.logLeadNameChange(newLead.Id, oldLead.Name, newLead.Name);
        }
    }
}
