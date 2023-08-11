public class Training
{
	public static void calculate()
     {
        for (Integer i = 1; i <= 100; i++)
         {
            if ( math.mod(i, 9) != 0)
             {
                System.debug(i);    
            }
        }
    }
    public static Integer sumTwoNumbers(Integer number1, Integer number2) 
    {
        Integer sum = number1 + number2;
        return sum;
    }
    public static void generateNumberPyramid() {
        Integer rows = 5;
        Integer num = 1;
        for (Integer i = 1; i <= rows; i++) {
        
            for (Integer k = 1; k <= rows - i; k++) {
                System.debug(' ');
            }
            for (Integer j = 1; j <= i; j++) {
                System.debug(num + ' ');
                num++;
            }
            System.debug('\n');
        }
        }
        // I use
        public static void reverseString(){
        String inputName = 'Prabhakaran';
        String reverseName = inputName.reverse();
        system.debug('Reversed Name = ' + reverseName);
    
        }
        public static void primeNumber(){
            for(Integer prime = 1;prime<=100;prime++){
                Integer count = 0;
                for(Integer num = prime;num>=1; num-- ){
                    if(Math.mod(prime, num)==0){
                        count++;
                    }
                    if(count==2 || count==1){
                        System.debug(prime);
                    }
                    else{
                        System.debug('Not a primeNumber');
                    }
                }
            }
        }
        public static Lead createLeadRecord(String lastName, String email, Date dateOfBirth) {
                 if (lastName.equalsIsIgnoreCase('test')){
                System.debug('Last name is "test". Lead creation skipped.');
                return null;
                 }
    
            // Set the default date of birth to January 1, 1990, if dateOfBirth is not specified.
            if (dateOfBirth == null) {
                dateOfBirth = Date.newInstance(1990, 01, 01);
              
            }
    
            Lead leadRecordToInsert = new Lead(LastName = lastName, Email = email, DOB_for_test__c = dateOfBirth);
            insert leadRecordToInsert;
            return leadRecordToInsert;
        }
        }   