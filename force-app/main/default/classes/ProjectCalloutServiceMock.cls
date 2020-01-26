public class ProjectCalloutServiceMock implements HttpCalloutMock {
	//Implement http mock callout here
	public HttpResponse respond(HttpRequest req) {
		HttpResponse response = new HttpResponse();
		response.setHeader('Content-Type', 'application/json');
		response.setStatus('Created');
		response.setStatusCode(201);
		return response;
	}
}