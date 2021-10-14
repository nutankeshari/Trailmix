@isTest
Global Class ParkServiceMock implements WebServiceMock{
global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType){
        // start - specify the response you want to send
        ParkService.byCountryResponse countryResponse = new ParkService.byCountryResponse();
        List<String> countryList = new List<String>();
        countryList.add('Australia');
        countryList.add('India');
        countryResponse.return_x = countryList;
        // end
        response.put('response_x', countryResponse); 
   }
}