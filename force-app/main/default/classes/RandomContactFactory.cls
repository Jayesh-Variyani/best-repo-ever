public with sharing class RandomContactFactory {

	public static List<Contact> generateRandomContacts(Integer noOfContacts, String lNameOfContacts){
		List<Contact> newListOfContacts = new List<Contact>();
		for (Integer index = 0; index < noOfContacts; index++) {
			String uniqueFirstName = 'Test'+index;
			Contact con = new Contact(FirstName = uniqueFirstName, LastName = lNameOfContacts);
			newListOfContacts.add(con);
		}
		return newListOfContacts;
	}
}
