public class ProcessIntegrationData {
    public static void processAndLogData(List<Lead> newLeads, List<Integration_Log__c> logList) {
        for (Lead lead : newLeads) {
            // Perform integration logic here
            String requestBody = ''; // Populate with actual request body
            String responseBody = ''; // Populate with actual response body

            // Create a new log record
            Integration_Log__c log = new Integration_Log__c(
                Request_Body__c = requestBody,
                Response_Body__c = responseBody,
                Is_Sucessful__c = true
            );
            logList.add(log);
        }

        if (!logList.isEmpty()) {
            insert logList;
        }
    }
}
