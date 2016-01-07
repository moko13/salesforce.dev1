trigger ClosedOpportunityTrigger on Opportunity (after Insert, after Update) {
    
    List<Task> tasks = new List<Task>();

    for(Opportunity opp : Trigger.New) {
        if (opp.StageName == 'Closed Won') {
            tasks.add(new Task(subject ='Follow Up Test Task', whatID = opp.id));
        }
    }
    insert tasks;
    
}