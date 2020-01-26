public class ProjectCalloutServiceMockFailure implements HttpCalloutMock{
   //Implement http mock callout failure here 
   public HttpResponse respond(HttpRequest req){
      HttpResponse res = new HttpResponse();
      res.setHeader('Content-Type','application/json');
      res.setStatus('Bad Request');
      res.setStatusCode(400);
      return res;
   }
}