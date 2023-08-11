public virtual class UtilityHelper {
    public static String generateRandomString() {
        Integer randomNum = (Integer)Math.floor(Math.random() * 1000) + 1;
        String randomString = String.valueOf(randomNum);

        System.debug('Generated Random String: ' + randomString);
        return randomString;
    }
    public static Boolean validateLoggedInUserHasCreateAccessToObject(String objectName) {

        // Check if the current user has create access on the specified object
        // Step 1: Get the SObjectType of the object
        
        Schema.SObjectType objType = Schema.getGlobalDescribe().get(objectName);

        // Step 2: Check if the current user has create permission on the object
        // if (objType != null) {
            // Schema.SObjectField createField = objType.getDescribe().getFieldDefinition('IsCreateable');

            if (objType != null && objType.getDescribe().IsCreateable()) {
                system.debug(objType.getDescribe().IsCreateable());
                // The user has create access on the object
                return objType.getDescribe().IsCreateable();
            }
        //}
        // If the object does not exist or the user doesn't have create access
        return false;

    }
}