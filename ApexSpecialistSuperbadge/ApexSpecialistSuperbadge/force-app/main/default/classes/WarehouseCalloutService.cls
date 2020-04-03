public with sharing class WarehouseCalloutService {

	private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';

	public static void runWarehouseEquipmentSync() {
		//ToDo: complete this method to make the callout (using @future) to the
		//      REST endpoint and update equipment on hand.
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://th-superbadge-apex.herokuapp.com/equipment');
		request.setMethod('GET');

		Http http = new Http();
		HttpResponse response =  http.send(request);
		// If the request is successful, parse the JSON response.
		if (response.getStatusCode() == 200) {
			// Deserialize the JSON string into collections of primitive data types.
			//Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
			// Cast the values in the 'animals' key as a list
			//List<Product2> animals = (List<Product2>) results.get('');
			System.debug('Received the following]:'+results);
			/* for (Product2 animal: animals) {
			    System.debug(animal);
			   } */
		}

	}

	public class fromJSON {
		public String name;
		public Boolean replacement;
		public Integer quantity;
		public Integer maintenanceperiod;
		public Integer lifespan;
		public Integer cost;
		public String sku;
		public String id;

		public List<fromJSON> parse(String json){
			json.replace('"id":', '"_id ":');
			return (List<fromJSON>)System.JSON.deserializeStrict(json,fromJSON.class);  
		}
	}
}