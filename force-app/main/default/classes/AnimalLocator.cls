public class AnimalLocator {
    Public static string getAnimalNameById(Integer I){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+I);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        Map<String,Object> responseMap=(Map<String,Object>)JSON.deserializeUntyped(response.getbody());
        system.debug('===='+responseMap);
        Object obj=responseMap.get('animal');
        Map<string,Object> finalMap=(Map<String,Object>)obj;
        return (String)finalMap.get('name');
    }    
}