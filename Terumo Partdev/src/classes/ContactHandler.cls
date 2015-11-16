/************************************************************************
 * Name  : ContactHandler
 * Author : Deloitte Consulting
 * Desc  : This is the handler class for Contact trigger    
 *
 * Modification Log:
 * ----------------------------------------------------------------------
 * Developer                    Date            Description
 * ----------------------------------------------------------------------
 * NSebastian@Deloitte         11/12/2015             Original Version
 * 
 *************************************************************************/

public with sharing class ContactHandler {
    // private Boolean isExecuting = false;
 //    private integer batchSize= 0;
        
//      /* Method Name: ContactHandler
//       * Author Name: NSebastian@Deloitte
//       * Description: This is the Constructor
//       * Parameters: 
//       * Returns:   NA
//       */
    // public ContactHandler(boolean isExecuting,integer batchSize) {
 //        this.isExecuting = isExecuting;
 //        this.batchSize = batchSize;
 //    }

//      /* Method Name: ContactHandler
//       * Author Name: NSebastian@Deloitte
//       * Description: This is the Constructor
//       * Parameters: 
//       * Returns:   NA
//       */
    // public ContactHandler() {        
 //    }
 
      /* Method Name: OnBeforeInsert
       * Author Name: NSebastian@Deloitte
       * Description: EXECUTE BEFORE INSERT LOGIC
       * Parameters: newcontactList
       * Returns:   void
       */
     public void OnBeforeInsert(Contact[] newcontactList) {
       	checkDuplicates(newcontactList[0]);

       
     }

 //     /* Method Name: OnAfterInsert
//       * Author Name: NSebastian@Deloitte
//       * Description: EXECUTE AFTER INSERT LOGIC
//       * Parameters: newcontactList, contactMap
//       * Returns:   void
//       */  
 //    public void OnAfterInsert(List<Contact> newcontactList, Map<ID, Contact> contactMap) {
        
 //    }    

//      /* Method Name: OnBeforeUpdate
//       * Author Name: NSebastian@Deloitte
//       * Description: EXECUTE BEFORE UPDATE LOGIC
//       * Parameters: oldcontactList, oldcontactMap, updatedcontactList, newcontactMap
//       * Returns:   void
//       */
 //    public void OnBeforeUpdate(List<Contact> oldcontactList,List<Contact> updatedcontactList, Map<ID, Contact> oldcontactMap, Map<ID, Contact> newcontactMap) {
 //    }
     
//      /* Method Name: OnAfterUpdate
//       * Author Name: NSebastian@Deloitte
//       * Description: EXECUTE AFTER UPDATE LOGIC
//       * Parameters: oldcontactList, updatedcontactList
//       * Returns:   void
//       */
 //    public void OnAfterUpdate(List<Contact> oldcontactList,List<Contact> updatedcontactList,  Map<ID, Contact> contactMap){
          
 //    }
    
//      /* Method Name: OnBeforeDelete
//       * Author Name: NSebastian@Deloitte
//       * Description: EXECUTE BEFORE DELETE LOGIC
//       * Parameters: contactsToDelete, contactMap
//       * Returns:   void
//       */
 //    public void OnBeforeDelete(List<Contact> contactsToDelete, Map<ID, Contact> contactMap) {
    
 //    }
     
//      /* Method Name: OnAfterDelete
//       * Author Name: NSebastian@Deloitte
//       * Description: EXECUTE AFTER DELETE LOGIC
//       * Parameters: deletedcontacts list, contactMap
//       * Returns:   void
//       */
 //    public void OnAfterDelete(List<Contact> deletedcontacts, Map<ID, Contact> contactMap){
    
 //    }
     
//      /* Method Name: OnUndelete
//       * Author Name: NSebastian@Deloitte
//       * Description: EXECUTE On UNDELETE LOGIC
//       * Parameters: restoredcontacts
//       * Returns:   void
//       */
 //    public void OnUndelete(List<Contact> restoredcontacts){
        
 //    }
    
    // ================================================
    //Methods

    /* Method Name: checkDuplicates
     * Author Name: NSebastian@Deloitte
     * Description: Check for duplicate Contact
     * Parameters: 
     * Returns:    void
     */
    public void checkDuplicates(Contact con) {
    	List<Contact> matchList = new List<Contact>();
   		String val;
    	System.debug('Check:con'+con);
    	//Map<String, Schema.SObjectField> objectFields = Contact.fields.getMap();
    	//System.debug('Check:con.LastName'+con.LastName);
    	//List<CS_Duplicate_Check_Fields__c> cslist = [SELECT Source_Field__c, Target_Field__c FROM CS_Duplicate_Check_Fields__c WHERE
                                                        //Source_Object__c = 'Contact' AND Target_Object__c = 'Contact' LIMIT 100];
        //String query = 'select ';
        //for(Schema.FieldSetMember fld: SObjectType.Contact.FieldSets.Duplicate_Record_fields_to_display.getFields()) {
        //    query += fld.getFieldPath() + ',';
        //}

        //query = query.removeEnd(',');
        //System.debug('Check:query'+query);
        //query += ' from Contact where ';
        //for(CS_Duplicate_Check_Fields__c cs: cslist) {
        //	val = (String)con.get(cs.Source_Field__c);
        //	System.debug('Check:val'+val);
        //	//if(objectFields.get(cs.Source_Field__c).getDescribe().getType())
        //    query += cs.Target_Field__c + '= \''+val+'\' and ';
        //}
        //query = query.removeEnd('and ');
        //System.debug('Check:query'+query);
        //System.debug('Check:con'+con);
        //matchList = Database.query(query);
        matchList = [SELECT Id, Name, Email from Contact WHERE LastName = :con.LastName AND (Email = :con.Email OR MobilePhone = :con.MobilePhone) LIMIT 1000];
    	if(!matchList.isEmpty() && !con.Check_Error__c) {
       		con.Check_Error__c = true;
       		System.debug('Check:con'+con);
       		showWarning(con,matchList);
       	}
       	else {
       		con.Check_Error__c = false;
       	}
       	
    }


    /* Method Name: showWarning
     * Author Name: NSebastian@Deloitte
     * Description: This method shows warning on the page when there is duplicate
     * Parameters: 
     * Returns:    void
     */
    public void showWarning(Contact con, List<Contact> matchList) {
    	if(con.Check_Error__c) {
    		String errormessage = matchList.size()+' matching record(s) already exist!<br/><table><tr><th>Id</th><th>Name</th><th>Email</th></tr>';
    		for(Contact mat:matchList) {
    			errormessage += '<tr><td>'+mat.Id+'</td><td><a href=\'/'+mat.Id+'\'>'+mat.Name+'</a></td><td>'+mat.Email+'</td></tr>';
    		}
    		con.addError(errormessage+'</table>',false);
    		con.Check_Error__c = true;
    		System.debug('Check:end');
    	}
    	//return
    }
    

    
}