/************************************************************************
 * Name  : CreateNewContactController
 * Author : Deloitte Consulting
 * Desc  : This is the Controller class for the updated logic in Create page for Contacts. Its an extension Controller which checks for duplicates for the new COntact in the system.   
 *
 * Modification Log:
 * ----------------------------------------------------------------------
 * Developer                    Date            Description
 * ----------------------------------------------------------------------
 * NSebastian@Deloitte         11/4/2015             Original Version
 * 
 *************************************************************************/
public with sharing class CreateNewContactController {
    
    //Variables
    public Account account {get;set;}
    private ApexPages.StandardController controller;
    public Contact con {get;set;}
    public List<Contact> matchList {get;set;}

/* Method Name: CreateNewContactController
 * Author Name: NSebastian@Deloitte
 * Description: This is the Constructor
 * Parameters: 
 * Returns:    NA
 */
    public CreateNewContactController() {
        
    }
    
/* Method Name: CreateNewContactController
 * Author Name: NSebastian@Deloitte
 * Description: This is the Constructor
 * Parameters: ApexPages.StandardController
 * Returns:    NA
 */
    public CreateNewContactController(ApexPages.StandardController controller) {
        List<String> fieldlist = new List<String>();
        this.controller = controller;
        //for(Schema.FieldSetMember fld: SObjectType.Contact.FieldSets.Duplicate_Record_fields_to_display.getFields()) {
        //    fieldList.add(fld.getFieldPath());
        //}
        //controller.addFields(fieldlist);

        controller.addFields(new List<String>{'LastName','Email','MobilePhone'});
        con = (Contact)controller.getRecord();
        System.debug('Check:con'+con);
        //if(!checkDuplicates(con).IsEmpty()) {
        //    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.FATAL, matchList.size() + System.Label.TBCT_ContactDuplicate_Error));
        //}
    }
    
    //methods


    /* Method Name: saveContact
     * Author Name: NSebastian@Deloitte
     * Description: Save record
     * Parameters: 
     * Returns:    PageReference
     */
    public PageReference saveContact() {
        List<Contact> conlist = checkDuplicates(con);
        if(!conlist.isEmpty()) {
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.FATAL, matchList.size() + System.Label.TBCT_ContactDuplicate_Error));
        }
        return null;
    }
    
 /* Method Name: checkDuplicates
     * Author Name: NSebastian@Deloitte
     * Description: check for duplicate records
     * Parameters: 
     * Returns:    List<Contact>
     */ 
    public List<Contact> checkDuplicates(Contact con) {
        //try {
            System.debug('Check:checkDuplicates');
            
            //matchList = [SELECT Id, FirstName, LastName 
            //                            FROM Contact WHERE
            //                            LastName = :con.LastName AND
            //                            (Email = :con.Email OR MobilePhone = :con.MobilePhone)
            //                            LIMIT 100];

            List<CS_Duplicate_Check_Fields__c> cslist = [SELECT Source_Field__c, Target_Field__c FROM CS_Duplicate_Check_Fields__c WHERE
                                                        Source_Object__c = 'Contact' AND Target_Object__c = 'Contact' LIMIT 100];
            String query = 'select ';
            for(Schema.FieldSetMember fld: SObjectType.Contact.FieldSets.Duplicate_Record_fields_to_display.getFields()) {
                query += fld.getFieldPath() + ',';
            }

            query = query.removeEnd(',');
            System.debug('Check:query'+query);
            query += ' from Contact where ';
            for(CS_Duplicate_Check_Fields__c cs: cslist) {
                query += cs.Target_Field__c + '= :con.' + cs.Source_Field__c + ' and ';
            }
            query = query.removeEnd('and ');
            System.debug('Check:query'+query);
            System.debug('Check:con'+con);
            matchList = Database.query(query);
            if(!matchList.isEmpty()) {
                return matchList;
            }
            saveRec();
        //
        return null;
    }
    

    /* Method Name: saveRec
     * Author Name: NSebastian@Deloitte
     * Description: Save record
     * Parameters: 
     * Returns:    PageReference
     */
    public PageReference saveRec() {
        System.debug('Check:beforeSave');
        PageReference detailpage = controller.save();
        System.debug('Check:saveRecMethod after');
        if (detailPage != null) {
        // Construct URL of edit page or whatever other page you want
            PageReference editPage = new PageReference(detailPage.getUrl() + '/e');
            return editPage;
        } else {
            return detailPage;
        }
    }
}


//public void describeLayoutSample(){
//  try {
//      String objectToDescribe = "Account";
//      DescribeLayoutResult dlr = 
//          connection.describeLayout(objectToDescribe, null, null);
//      System.out.println("There are " + dlr.getLayouts().length +
//          " layouts for the " + objectToDescribe + " object."
//      );
      
//      // Get all the layouts for the sObject
//      for(int i = 0; i < dlr.getLayouts().length; i++) {
//        DescribeLayout layout = dlr.getLayouts()[i];
//        DescribeLayoutSection[] detailLayoutSectionList = 
//          layout.getDetailLayoutSections();
//        System.out.println(" There are " +
//          detailLayoutSectionList.length + 
//            " detail layout sections");
//        DescribeLayoutSection[] editLayoutSectionList = 
//          layout.getEditLayoutSections();
//        System.out.println(" There are " +
//          editLayoutSectionList.length + 
//          " edit layout sections");
        
//        // Write the headings of the detail layout sections 
//        for(int j = 0; j < detailLayoutSectionList.length; j++) {
//          System.out.println(j + 
//              " This detail layout section has a heading of " + 
//              detailLayoutSectionList[j].getHeading());              
//        }
        
//        // Write the headings of the edit layout sections 
//        for(int x = 0; x < editLayoutSectionList.length; x++) {  
//          System.out.println(x + 
//              " This edit layout section has a heading of " + 
//              editLayoutSectionList[x].getHeading());  
//        }
                          
//        // For each edit layout section, get its details.
//        for(int k = 0; k < editLayoutSectionList.length; k++) {
//          DescribeLayoutSection els = 
//            editLayoutSectionList[k];    
//          System.out.println("Edit layout section heading: " + 
//              els.getHeading());
//          DescribeLayoutRow[] dlrList = els.getLayoutRows();
//            System.out.println("This edit layout section has " +
//                dlrList.length + " layout rows.");
//            for(int m = 0; m < dlrList.length; m++) {
//              DescribeLayoutRow lr = dlrList[m];
//              System.out.println(" This row has " + 
//                  lr.getNumItems() + " layout items.");
//              DescribeLayoutItem[] dliList = lr.getLayoutItems();
//              for(int n = 0; n < dliList.length; n++) {
//                DescribeLayoutItem li = dliList[n];
//                if ((li.getLayoutComponents() != null) && 
//                  (li.getLayoutComponents().length > 0)) {
//                  System.out.println("\tLayout item " + n + 
//                      ", layout component: " + 
//                      li.getLayoutComponents()[0].getValue());
//                }
//                else {
//                System.out.println("\tLayout item " + n + 
//                      ", no layout component");                  
//                }                    
//              }
//            }
//         }
//      }
      
//      // Get record type mappings
//      if (dlr.getRecordTypeMappings() != null) {
//        System.out.println("There are " +
//            dlr.getRecordTypeMappings().length + 
//            " record type mappings for the " +
//            objectToDescribe + " object"
//        );
//      } else {
//        System.out.println(
//            "There are no record type mappings for the " +
//            objectToDescribe + " object."
//        );
//      }
//    } catch (ConnectionException ce) {
//      ce.printStackTrace();
//    }
//}