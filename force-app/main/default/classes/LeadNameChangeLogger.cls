public class LeadNameChangeLogger {
    public static void logLeadNameChange(Id leadId, String oldName, String newName) {
        Lead_Name_Change_Log__c log = new Lead_Name_Change_Log__c();
        log.Lead_log__c = leadId;
        log.Old_Name__c = oldName;
        log.New_Name__c = newName;
        log.Changed_By__c = UserInfo.getUserId();
        log.Changed_At__c = System.now();
        
        insert log;
    }
}
