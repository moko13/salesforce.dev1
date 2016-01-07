public class NewCaseListController {
	Public List<Case> getNewCases () {
        List<Case> cas = [SELECT id, CaseNumber FROM Case WHERE Status = 'New'];
        return cas;
    }
}