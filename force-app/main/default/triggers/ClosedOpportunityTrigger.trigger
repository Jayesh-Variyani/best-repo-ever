trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
	List<Task> taskList = new List<Task>();
	for (Opportunity opp : Trigger.new) {
		if(opp.StageName == 'Closed Won') {
			Task taskInstance = new Task();
			taskInstance.Subject = 'Follow Up Test Task';
			taskInstance.WhatId = opp.Id;
			taskList.add(taskInstance);
		}
	}
	Database.insert(taskList); my changes
}