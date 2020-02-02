@isTest(seeAllData = false)
public without sharing class TestRestrictContactByName {

	public @IsTest
	static void testScenarioOne(){
		Test.startTest();
		Contact c1 = new Contact(LastName = 'INVALIDNAME');
		try {
			Database.insert(c1);
		} catch (Exception e) {
			System.assert (e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'));
		}
		Test.stopTest();
	}
}
