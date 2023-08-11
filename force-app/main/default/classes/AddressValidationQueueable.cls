public class AddressValidationQueueable implements Queueable {
    private Account account;

    public AddressValidationQueueable(Account acc) {
        this.account = acc;
    }

    public void execute(QueueableContext context) {
      
        String googleMapsApiKey = 'AIzaSyC4SOeANsk58rU8e5iVcp4CGx5RvolFLlY';
        String validatedAddress = GoogleMapsApiService.validateAddress(
            googleMapsApiKey,
            account.BillingStreet,
            account.BillingCity,
            account.BillingState,
            account.BillingPostalCode,
            account.BillingCountry
        );

    
        if (validatedAddress != Null ) {
            account.BillingStreet = validatedAddress;
            account.Address_Validation_Bypass__c = false;
            update account;
        }
    }
}
