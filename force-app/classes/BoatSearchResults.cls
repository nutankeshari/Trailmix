public class BoatSearchResults {
  
    @AuraEnabled
    public static List<Boat__c> getBoats(String boatTypeId){
       
        if(boatTypeId == ''){
            return [SELECT id,Price__c,Length__c, BoatType__c, picture__c, 
                    name,contact__r.Name,Contact__r.Email,Contact__r.HomePhone,BoatType__r.Name,Geolocation__Latitude__s,Geolocation__Longitude__s from Boat__c];
        }
        else{
            return [SELECT id,Price__c,Length__c, BoatType__c, picture__c, 
                    name,contact__r.Name,Contact__r.Email,Contact__r.HomePhone,BoatType__r.Name,Geolocation__Latitude__s,Geolocation__Longitude__s from Boat__c where BoatType__c =: boatTypeId];
        }
        
    }
}