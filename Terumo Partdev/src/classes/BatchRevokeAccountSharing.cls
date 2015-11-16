/************************************************************************
 * Name  : BatchRevokeAccountSharing
 * Author : Deloitte Consulting
 * Desc  : This batch class checks for Account sharing expiry and deletes the sharing records
 *
 * Modification Log:
 * ----------------------------------------------------------------------
 * Developer                    Date            Description
 * ----------------------------------------------------------------------
 * NSebastian@Deloitte         11/10/2015             Original Version
 * 
 *************************************************************************/
 global class BatchRevokeAccountSharing implements Database.Batchable<SObject>{
        private Date thisdate;
        private String pendingStatus = 'Pending';
        private String processedStatus = 'Processed';
        global BatchRevokeAccountSharing(){
                   // Batch Constructor
                   thisdate = System.today();
        }
       
        // Start Method
        global Database.QueryLocator start(Database.BatchableContext BC){
          //String query = 'SELECT Id FROM AccountShare WHERE Id IN (SELECT AccountShareID__c FROM Account_Share_Log__c WHERE Expiry_Date__c =:System.today()) LIMIT 200';
        	//Date thisdate = System.today();
          String query = 'SELECT AccountShareID__c FROM Account_Share_Log__c WHERE Expiry_Date__c = :thisdate AND Status__c = :pendingStatus';
          return Database.getQueryLocator(query);
        }
      
      // Execute Logic
       global void execute(Database.BatchableContext BC, List<Account_Share_Log__c> scope){
              // Logic to be Executed batch wise 
              List<AccountShare> accountShareList = new List<AccountShare>();
              for(Account_Share_Log__c log: scope) {
                accountShareList.add(new AccountShare(Id= log.AccountShareID__c));
                log.Status__c = processedStatus;
              }
              Database.delete(accountShareList); 
              Database.update(scope);

     
       }
     
       global void finish(Database.BatchableContext BC){
            // Logic to be Executed at finish
            
       }
    }