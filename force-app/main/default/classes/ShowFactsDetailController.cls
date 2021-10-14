/**
 * @description       : 
 * @author            : nutan.keshari11@gmail.com
 * @group             : 
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   05-06-2021   nutan.keshari11@gmail.com   Initial Version
**/
public with sharing class ShowFactsDetailController {

    @AuraEnabled(Cacheable=true)
    public static List<wrapperData> getShowFactsDetail(String animalType, Integer NoOfFacts) {
        
        List<wrapperData> lstWrapper = new List<wrapperData>();

        Http h = new Http(); 
        String url = 'https://cat-fact.herokuapp.com/facts/random?animal_type={animalType}&amount={amount}';
        url=url.replace('{animalType}',animalType);
        url=url.replace('{amount}',String.valueof(NoOfFacts));
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url );
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        List<Object> lstResponse = (List<Object>)JSON.deserializeUntyped(res.getbody());
        for(Object objResponce : lstResponse){
            wrapperData objWrapper = new wrapperData();
            Map<String,Object> mapRes = (Map<String,Object>)objResponce;
            objWrapper.factType = (String)mapRes.get('type');
            objWrapper.factText = (String)mapRes.get('text');
            objWrapper.NumberOfVotes =  (Integer)mapRes.get('sentCount');
            objWrapper.userName = (String)mapRes.get('user');
            lstWrapper.add(objWrapper);
        }
        return lstWrapper;
        
    }
        
    

    Public class wrapperData {
        @AuraEnabled
        Public String factType{get;set;}

        @AuraEnabled
        Public String factText{get;set;}

        @AuraEnabled
        Public Integer NumberOfVotes{get;set;}

        @AuraEnabled
        Public String userName{get;set;}
    }
}