global with sharing class statename {
    public static String getCountryName(String Cityname){
    Map<string,string> citytostate= New
                        Map<string,String>();
    Map<string,string> stateToCountry= new
                        Map<string,string>();
    For(State__c State: [select State_name__c, Capital_Name__c from State__c]) 
    {
        citytostate.put(State.Capital_Name__c,State.State_name__c)
    }
    For(Country__c country: [Select Name, State_Name__c for country__C,country_name__C from Country__C]) 
    {
        stateToCountry.put(country.state_name_for_country__C,country.country_name__C);
    }
    try{String relatedState = citytostate.get(cityname);
        string relatedcountry = stateToCountry.get(relatedState);
        return relatedcountry;
    }
    catch (DmlException expectError){
        throw new CustomException('No Matching');
    }
}
}