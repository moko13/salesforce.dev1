public with sharing class eventsController {

    public boolean displayPopup {get; set;}
    
    public Pagereference Setup(){

        // Create account
        PageReference pageRef = new PageReference('/apex/EventsSuccess');

        {
          //Create Sample Event Vendor Account and Contact
          //Removed state and country to avoid conflicts with the State/Country picklist option
          //ShippingState = 'Texas', ShippingPostalCode = '78701', ShippingCountry = 'United States'
          Account a1 = new Account(Name = 'Test-Vendor', type = 'Event Vendor', phone = '(512) 555-1234',
          ShippingStreet = '123 Main St.', ShippingCity = 'Austin');
          insert a1;

          Contact c1 = new Contact(FirstName = 'John', LastName = 'Vendor', AccountId = a1.Id, Email = 'john_vendor@mailinator.com',
          Phone = '(512) 555-1234', Title = 'Event Coordinator', MailingStreet = '123 Main St.', MailingCity = 'Austin');
          insert c1;

          //Create Sample Customer Account and Contacts
          Account a2 = new Account(Name = 'Test-Customer', type = 'Customer - Direct', phone = '(512) 555-5678',
          ShippingStreet = '321 6th St.', ShippingCity = 'Austin');
          insert a2;

          Contact c2 = new Contact(FirstName = 'Jane', LastName = 'Customer', AccountId = a2.Id, Email = 'jane_customer@mailinator.com',
          Phone = '(512) 555-5678', Title = 'Tech Manager', MailingStreet = '321 6th St.', MailingCity = 'Austin');       
          insert c2;
            
          Contact c3 = new Contact(FirstName = 'Jeff', LastName = 'Customer', AccountId = a2.Id, Email = 'jeff_customer@mailinator.com',
          Phone = '(512) 555-5678', Title = 'CEO', MailingStreet = '321 6th St.', MailingCity = 'Austin');
          insert c3;
            
          //Create sample venue and rooms
          Venue__c v1 = new Venue__c(Name = 'Test Convention Center', Street_Address_1__c= '500 E Cesar Chavez St', 
          City__c = 'Austin', State__c='Texas', Postal_Code_Zip__c='78701', Country__c='United States');
          insert v1;
         
          Room__c r1 = new Room__c(Name = 'Main Hall',Venue__c=v1.Id);
          insert r1;              
          Room__c r2 = new Room__c(Name = 'Classroom A',Venue__c=v1.Id);
          insert r2;
          Room__c r3 = new Room__c(Name = 'Classroom B',Venue__c=v1.Id);
          insert r3;                            
          
          Date sDate= System.today().addDays(30);
          Date eDate= System.today().addDays(31);
             
          //Create sample Event, Tracks , Sessions and Speakers
          Event__c ev = new Event__c(Name = 'Test Event', Event_Manager__c=UserInfo.getUserId(), Venue__c=v1.Id,               
          Event_Description__c='This is a test event', Event_Type__c='User Conference', Event_Vendor_Account__c =a1.Id, 
          Event_Website__c='www.dreamforce.com', Primary_Vendor_Contact__c=c1.Id, Region__c='Worldwide',
          Venue_Status__c='Confirmed', Event_Start_Date__c=sDate, Event_End_Date__c=eDate, Maximum_Registration__c=10,
          Targeted_Attendance__c='Users and Developers of our products');
          insert ev; 
              
          Track__c t1 = new Track__c(Name = 'Business', Event__c=ev.Id, Track_Status__c='Finalized',Track_Category__c='Category #1');
          insert t1;
          Track__c t2 = new Track__c(Name = 'Technical', Event__c=ev.Id, Track_Status__c='Finalized',Track_Category__c='Category #2');
          insert t2;              
          
          Session__c se1 = new Session__c(Name = 'Opening Keynote (Biz)', All_Speakers_Identified__c='Yes', Room__c=r1.Id,
          Room_Setup__c = 'Theater', Track__c = t1.Id, Level__c='All', Session_Format__c= 'Keynote', Session_Date__c=sDate,
          Session_Time__c = '8:00 AM', Session_Status__c = 'Ready to Publish');
          insert se1;
          Session__c se2 = new Session__c(Name = 'Business Today', All_Speakers_Identified__c='Yes', Room__c=r2.Id,
          Room_Setup__c = 'Rounds', Track__c = t1.Id, Level__c='Beginner', Session_Format__c= 'Presentation with customer(s)',
          Session_Date__c=sDate, Session_Time__c = '9:00 AM', Session_Status__c = 'Abstract - Submitted');
          insert se2;
          Session__c se3 = new Session__c(Name = 'Opening Keynote (Tech)', All_Speakers_Identified__c='Yes', Room__c=r1.Id,
          Room_Setup__c = 'Theater', Track__c = t2.Id, Level__c='All', Session_Format__c= 'Keynote', Session_Date__c=eDate,
          Session_Time__c = '8:00 AM', Session_Status__c = 'Dry Run - Complete');
          insert se3;
          Session__c se4 = new Session__c(Name = 'Intro to Programming', All_Speakers_Identified__c='Yes', Room__c=r2.Id,
          Room_Setup__c = 'Classroom', Track__c = t2.Id, Level__c='Intermediate', Session_Format__c= 'Hands-on training',
          Session_Date__c=eDate, Session_Time__c = '9:00 AM', Session_Status__c = 'Slides - Locked');
          insert se4;
              
          Speaker__c sp1 = new Speaker__c(Speaker_Contact__c=c1.Id, Session__c=se1.Id, Account__c=a1.Id, Track__c=t1.Id,
          Speaker_Status__c='Ready to Publish');
          insert sp1;
          Speaker__c sp2 = new Speaker__c(Speaker_Contact__c=c3.Id, Session__c=se2.Id, Account__c=a2.Id, Track__c=t1.Id,
          Speaker_Status__c='Ready to Publish');
          insert sp2;
          Speaker__c sp3 = new Speaker__c(Speaker_Contact__c=c1.Id, Session__c=se3.Id, Account__c=a1.Id, Track__c=t2.Id,
          Speaker_Status__c='Request - accepted');
          insert sp3;
          Speaker__c sp4 = new Speaker__c(Speaker_Contact__c=c2.Id, Session__c=se4.Id, Account__c=a2.Id, Track__c=t2.Id,
          Speaker_Status__c='Request - sent');
          insert sp4;                                                      
            
          return pageRef;
        }

    }

    public void closePopupOK() {
        
        RemoveData();
        displayPopup = false;
    }

    public void closePopupCancel() {
        displayPopup = false;
    }
 
    public void showPopup() {
        displayPopup = true;
    }
    
    private void RemoveData(){

      try {
        List<Account> a1= [SELECT Id From Account Where Name = 'Test-Vendor'];
        delete a1;
        }
      catch (exception e) {
        //Likely the record does not exist
        }  

      try {
        List<Account> a2= [SELECT Id From Account Where Name = 'Test-Customer'];
        delete a2;                                                   
        }
      catch (exception e) {
        //Likely the record does not exist
        }
                
      try {
        List<Venue__c> v1= [SELECT Id From Venue__c Where Name = 'Test Convention Center'];
        delete v1; 
        }
      catch (exception e) {
        //Likely the record does not exist
        }
                  
      try {
        List<Event__c> e1 = [select Id from Event__c Where Name = 'Test Event'];
        delete e1;
        }
      catch (exception e) {
        //Likely the record does not exist
        }    

      //return pageRef;

    }    

}