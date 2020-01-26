@ isTest
private class ProjectCalloutServiceTest {

	@TestSetup
	private static void setup() {
		ServiceTokens__c st = new ServiceTokens__c(name = 'ProjectServiceToken', 
												   Token__c = 'test-service-token');
		insert st;
	}

	@isTest
	private static void testFailure() {
		//create the opportunity record
		Opportunity opp2 = new Opportunity();
		opp2.Name = 'ABC Corp2';
		opp2.Type = 'New Project';
		opp2.Amount = 1000;
		opp2.CloseDate = Date.today();
		opp2.StageName = 'Resubmit Project';
		insert opp2;

		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMockFailure());
		ProjectCalloutService.postOpportunityToPMS(new List<Id>{ opp2.Id });
		Test.stopTest();

		List<Opportunity> opportunities = [SELECT Id,Name,Account.Name,CloseDate,Amount,StageName FROM Opportunity WHERE Id = :opp2.Id];
		System.assertEquals('Resubmit Project', opportunities.get(0).StageName);
	}

	@isTest
	private static void testSuccess() {
		//create the opportunity record
		Opportunity opp1 = new Opportunity();
		opp1.Name = 'ABC Corp1';
		opp1.Type = 'New Project';
		opp1.Amount = 1000;
		opp1.CloseDate = Date.today();
		opp1.StageName = 'Submitted Project';
		insert opp1;
		

		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMock());
		ProjectCalloutService.postOpportunityToPMS(new List<Id>{ opp1.Id });
		Test.stopTest();

		List<Opportunity> opportunities = [SELECT Id,Name,Account.Name,CloseDate,Amount,StageName FROM Opportunity WHERE Id = :opp1.Id];
		System.assertEquals('Submitted Project', opportunities.get(0).StageName);
	}
}