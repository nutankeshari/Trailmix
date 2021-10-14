public class BoatSearchForm{
    @AuraEnabled
    public static List<PickListWrapper> getInitValue() {
        List<PickListWrapper> lstPicklistWrapper = new List<PickListWrapper>();
        lstPicklistWrapper.add(new PickListWrapper('All Types',''));
        for(BoatType__c objBoatType: [SELECT Id, Name FROM BoatType__c])
        {
            lstPicklistWrapper.add(new PickListWrapper(objBoatType.Name,objBoatType.Id));
        }
        return lstPicklistWrapper;
    }
    
    
    public class PickListWrapper{
        @AuraEnabled
        public String name;
        @AuraEnabled
        public String value;
        
        public PickListWrapper(String name, String value){
            this.name = name;
            this.value = value;
        }
    }
}