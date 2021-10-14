@isTest
public class AnimalLocatorMock implements HttpcalloutMock {
    Public Httpresponse respond(Httprequest request){
    Httpresponse response = new Httpresponse();
    response.setstatuscode(200);
    response.setHeader('Content-Type','application/json;Charser=UTF-8');
    response.setBody('{"animal":{"eats":"chicken food","id":"1","name":"chicken","says":"cluck cluck"}}');
    return response;
    }

}