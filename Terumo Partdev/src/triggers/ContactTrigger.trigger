/************************************************************************
 * Name  : ContactTrigger 
 * Author : Deloitte Consulting
 * Desc  : This trigger checks for duplicates   
 *
 * Modification Log:
 * ----------------------------------------------------------------------
 * Developer                    Date            Description
 * ----------------------------------------------------------------------
 * NSebastian@Deloitte         11/12/2015             Original Version
 * 
 *************************************************************************/

trigger ContactTrigger on Contact (Before Insert,Before Update,After Insert,After Update,before delete,after delete) {

    ContactHandler handler = new ContactHandler();
    
     if(Trigger.isInsert && Trigger.isBefore){  //before insert
        handler.OnBeforeInsert(Trigger.new);
     }
    // else if(Trigger.isInsert && Trigger.isAfter){ // after insert
        
    // }
    // else if(Trigger.isUpdate && Trigger.isBefore){ // before update
        
    // }
    // else if(Trigger.isUpdate && Trigger.isAfter){ // after update        
        
    // }
    // else if(Trigger.isDelete && Trigger.isBefore){ // before delete
       
    // }
    // else if(Trigger.isDelete && Trigger.isAfter){  // after delete
       
    // }
    // else if(Trigger.isUnDelete){ // undelete
       
    // }
}