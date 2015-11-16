/************************************************************************
 * Name  : DuplicateCheckerController
 * Author : Deloitte Consulting
 * Desc  : Check duplicates 
 *
 * Modification Log:
 * ----------------------------------------------------------------------
 * Developer                    Date            Description
 * ----------------------------------------------------------------------
 * NSebastian@Deloitte         11/3/15             Original Version
 * 
 *************************************************************************/

public with sharing class DuplicateCheckerController {
    
    //Variables
    private ApexPages.StandardController controller;
    private Contact con = new Contact();
    public List<Contact> matchList {get;set;}

/* Method Name: DuplicateCheckerController
 * Author Name: NSebastian@Deloitte
 * Description: This is the Constructor
 * Parameters: ApexPages.StandardController
 * Returns:    NA
 */
    public DuplicateCheckerController(ApexPages.StandardController controller) {
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

/* Method Name: DuplicateCheckerController
 * Author Name: NSebastian@Deloitte
 * Description: This is the Constructor
 * Parameters: 
 * Returns:    NA
 */
    public DuplicateCheckerController() {}

    //methods


    ///* Method Name: checkDuplicates
    // * Author Name: NSebastian@Deloitte
    // * Description: check for duplicate records
    // * Parameters: 
    // * Returns:    List<Contact>
    // */ 
    //public List<Contact> checkDuplicates(Contact con) {
    //    //try {
    //        System.debug('Check:checkDuplicates');
            
    //        //matchList = [SELECT Id, FirstName, LastName 
    //        //                            FROM Contact WHERE
    //        //                            LastName = :con.LastName AND
    //        //                            (Email = :con.Email OR MobilePhone = :con.MobilePhone)
    //        //                            LIMIT 100];

    //        List<CS_Duplicate_Check_Fields__c> cslist = [SELECT Source_Field__c, Target_Field__c FROM CS_Duplicate_Check_Fields__c WHERE
    //                                                    Source_Object__c = 'Contact' AND Target_Object__c = 'Contact' LIMIT 100];
    //        String query = 'select ';
    //        for(Schema.FieldSetMember fld: SObjectType.Contact.FieldSets.Duplicate_Record_fields_to_display.getFields()) {
    //            query += fld.getFieldPath() + ',';
    //        }

    //        query = query.removeEnd(',');
    //        System.debug('Check:query'+query);
    //        query += ' from Contact where ';
    //        for(CS_Duplicate_Check_Fields__c cs: cslist) {
    //            query += cs.Target_Field__c + '= :con.' + cs.Source_Field__c + ' and ';
    //        }
    //        query = query.removeEnd('and ');
    //        System.debug('Check:query'+query);
    //        System.debug('Check:con'+con);
    //        matchList = Database.query(query);
    //        if(!matchList.isEmpty()) {
    //            return matchList;
    //        }
    //        saveRec();
    //    //
    //    return null;
    //}
    

    ///* Method Name: saveRec
    // * Author Name: NSebastian@Deloitte
    // * Description: Save record
    // * Parameters: 
    // * Returns:    PageReference
    // */
    //public PageReference saveRec() {
    //    System.debug('Check:beforeSave');
    //    PageReference detailpage = controller.save();
    //    System.debug('Check:saveRecMethod after');
    //    if (detailPage != null) {
    //    // Construct URL of edit page or whatever other page you want
    //        PageReference editPage = new PageReference(detailPage.getUrl() + '/e');
    //        return editPage;
    //    } else {
    //        return detailPage;
    //    }
    //}


    /* Method Name: testAction
     * Author Name: NSebastian@Deloitte
     * Description: Testing load action
     * Parameters: 
     * Returns:    PageReference
     */
    public PageReference testAction() {
        System.debug('Check:Testing load');
        return null;
        //return
    }
    
    

}