@isTest(seeAllData=true)
public class TestVerifyDate {

	@IsTest
	static void checkDates(){

		Test.startTest();
		VerifyDate.CheckDates(System.today().addDays(2), System.today());
		VerifyDate.CheckDates(System.today(), System.today().addDays(2));
		Test.stopTest();

	}
}
