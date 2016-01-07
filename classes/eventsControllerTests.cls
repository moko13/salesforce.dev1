public class eventsControllerTests {

static testMethod void myPage_Test()
  {
  //Test converage for the myPage visualforce page
  PageReference pageRef = Page.Events_Home;
  Test.setCurrentPageReference(pageRef);
  // create an instance of the controller
  eventsController myPageCon = new eventsController();
  //try calling methods/properties of the controller in all possible scenarios to get the best coverage.

  myPageCon.Setup();
  String efSetupPage = myPageCon.Setup().getUrl();
  System.assertEquals('/apex/EventsSuccess',efSetupPage);

  myPageCon.closePopupOK();

  }
  
    static testMethod void testRegistrationsTrigger(){
        
        //First, prepare 200 contacts for the test data
        
        String contactLastName = 'Apex';
        String contactFirstName = 'Joe';
        String contactTitle = 'Manager';
        Contact ct = new Contact(lastname=contactLastName, firstname=contactFirstName, title=contactTitle);
        insert ct;
        
        ct = [SELECT Name, Title from Contact WHERE Id = :ct.Id];
        
        Event__c ev = new Event__c(name = 'My Event');
        insert ev;

        Event_Registration__c reg = new Event_Registration__c(Contact__c=ct.Id,Event__c=ev.Id);
        insert reg;

        reg = [SELECT Name_on_Badge__c, Title_On_Badge__c from Event_Registration__c WHERE Id = :reg.Id];
        System.assertEquals(ct.Name, reg.Name_on_Badge__c);
        System.assertEquals(ct.Title, reg.Title_on_Badge__c);

           
    }   
}