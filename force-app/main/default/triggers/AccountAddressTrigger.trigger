trigger AccountAddressTrigger on Account (before insert,before update) {

	//Based on the Checkbox value set the ShippingPostalCode = BillingPostalCode
	// If Billing Postal Code exists &  Match_Billing_Address__c = true
	for (Account a : trigger.new) {
		if(a.BillingPostalCode != null && a.Match_Billing_Address__c) {
			a.ShippingPostalCode = a.BillingPostalCode;
		}
	}
}