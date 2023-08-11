public with sharing class ProcessIntegerationData implements Queueable, Database.AllowsCallouts {
    Id logId;

    public ProcessIntegerationData(Id logId) {
        this.logId = logId;
    }
    Public void execute(QueueableContext context){
        System.Debug(logId);
        Integration_Log__c LogRecord = [SELECT Id,Request_Body__c,Response_Body__c,Is_Sucessful__c FROM Integration_Log__c WHERE Id =: logId];
        Http httpConnection  = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();
        request.setEndpoint('https://www.toptal.com/developers/postbin/1691577541087-5996331442147');
        request.setMethod('POST');
        request.setBody(LogRecord.Request_Body__c);
        response = httpconnection.send(request);
        System.debug(response.getBody());
        System.debug(response.getStatusCode());
        LogRecord.Response_Body__c = response.getBody();
        if(response.getStatusCode() == 200){
            logRecord.Is_Sucessful__c = true;
        }
        update LogRecord;

    }
}