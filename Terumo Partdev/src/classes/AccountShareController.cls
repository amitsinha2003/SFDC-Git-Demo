/************************************************************************
 * Name  : AccountShareController
 * Author : Deloitte Consulting
 * Desc  : This is the controller class to create AccountShare records for AccountSharePage.    
 *
 * Modification Log:
 * ----------------------------------------------------------------------
 * Developer                    Date            Description
 * ----------------------------------------------------------------------
 * NSebastian@Deloitte         11/5/2015             Original Version
 * Amit Sinha				   11/15/2015            Testing Push to GitHub / Test 2
 * 
 *************************************************************************/
global with sharing class AccountShareController {
    
    //Variables
    public Date expiryDate {get;set;}
    public String accountSharingLevel {get;set;}
    public String opptySharingLevel {get;set;}
    public String caseSharingLevel {get;set;}
    public List<SelectOption> userList {get;set;}
    public List<SObject> userOrGroupList {get;set;}

    private ApexPages.StandardController controller;
    private Account thisAccount = new Account();
    public String accId {get;set;}
    public List<SelectOption> userTypes {get;set;}
    public List<SelectOption> accessLevels {get;set;}
    public String userType {get;set;}
    public String searchText {get;set;}
    public List<String> selectedUsers {get;set;}
    public Set<Id> accountIdSet {get;set;}
    public List<Id> accountIdList {get;set;}
/* Method Name: AccountShareController
 * Author Name: NSebastian@Deloitte
 * Description: This is the Constructor
 * Parameters: StandardController
 * Returns:    NA
 */
    public AccountShareController(ApexPages.StandardController controller) {
        this.controller = controller;
        thisAccount = (Account)controller.getRecord();
        accId = thisAccount.Id;
        userTypes = setUserTypes();
        accessLevels = setAccessLevels();
        accountIdSet = retrieveAllChildAccounts(new Set<Id>{accId});
        accountIdSet.add(accId);
        retrieveParentAccount(accId);
        accountIdList = new List<Id>();
        accountIdList.addAll(accountIdSet);

        //load existing sharing records and display.
    }

    //methods



    /* Method Name: retrieveAllChildAccounts
     * Author Name: NSebastian@Deloitte
     * Description: Retrieve all Accounts in the hierarchy
     * Parameters: Set<Id>
     * Returns:    Set<Id>
     */
    public Set<Id> retrieveAllChildAccounts(Set<Id> accSet) {
        Set<Id> currentAccountIdSet = new Set<Id>();
        for(Account acc :[SELECT Id FROM Account WHERE ParentId 
             IN :accSet AND ParentId != null]) {
            currentAccountIdSet.add(acc.Id);
        }
        if(currentAccountIdSet .size() > 0) {
            currentAccountIdSet.addAll(retrieveAllChildAccounts(currentAccountIdSet));
        }
        return currentAccountIdSet ;
    }


    /* Method Name: retrieveParentAccount
     * Author Name: NSebastian@Deloitte
     * Description: retrieve all parent accounts
     * Parameters: account id
     * Returns:    void
     */
    public void retrieveParentAccount(Id accId) {
        Account thisAccount = [SELECT ParentId FROM Account WHERE Id = :accId];
        if(thisAccount.ParentId!=null) {
            accountIdSet.add(thisAccount.ParentId);
            retrieveParentAccount(thisAccount.ParentId);
        }
    }
    
    

    /* Method Name: setAccessLevels
     * Author Name: NSebastian@Deloitte
     * Description: set the access level values
     * Parameters: 
     * Returns:    List<SelectOption>
     */
    public List<SelectOption> setAccessLevels() {
        //accessLevels.add(new SelectOption('None', 'Private'));
        //accessLevels.add(new SelectOption('Read', 'Read Only'));
        //accessLevels.add(new SelectOption('Edit', 'Read/Write'));
        //return accessLevels;
        return new List<SelectOption>{
                                    new SelectOption('None','Private'),
                                    new SelectOption('Read','Read Only'),
                                    new SelectOption('Edit', 'Read/Write')};
        //return new List<List<String>>{
        //                          new List<String>{'None','Private'},
        //                          new List<String>{'Read','Read Only'},
        //                          new List<String>{'Edit', 'Read/Write'}};
    }
    

    /* Method Name: setUserTypes
     * Author Name: NSebastian@Deloitte
     * Description: define the user types to be searched
     * Parameters: 
     * Returns:    List<SelectOption>
     */
    public List<SelectOption> setUserTypes() {
        //userTypes.add(new SelectOption('User','Users'));
        //return userTypes;
        return new List<SelectOption>{ 
                                    new SelectOption('User','Users')};
    }
    


    ///* Method Name: searchUsers
    // * Author Name: NSebastian@Deloitte
    // * Description: Retrieve the users that meet the search criteria
    // * Parameters: 
    // * Returns:    List<SelectOption>
    // */
    //public List<SelectOption> searchUsers() {
    //  System.debug('Check:searchText'+searchText);
    //  String searchString = '%'+searchText+'%';
    //  for(User usr: [SELECT Id,Name FROM User WHERE Name LIKE :searchString LIMIT 1000]) {
    //      userList.add(new SelectOption(usr.Id, usr.Name));
    //  }
    //  System.debug('Check:userList'+userList);
    //  return userList;
    //}
    
    
    /* Method Name: searchUsers
     * Author Name: NSebastian@Deloitte
     * Description: retrieve matching users in search
     * Parameters: 
     * Returns:    List<User>
     */
    //global static void searchUsers(String searchText) {
    @RemoteAction
    global static List<User> searchUsers(String searchText) {
        System.debug('Check:searchText'+searchText);
        String searchString = '%'+searchText+'%';
        //for(User usr: [SELECT Id,Name FROM User WHERE Name LIKE :searchString LIMIT 1000]) {
            //userList.add(new SelectOption(usr.Id, usr.Name));
        //}
        List<User> userList = new List<User>();
        userList = [SELECT Id,Name FROM User WHERE Name LIKE :searchString LIMIT 1000];
        System.debug('Check:userList'+userList);
        return userList;
    }
    


    /* Method Name: createAccountSharingRecords
     * Author Name: NSebastian@Deloitte
     * Description: This method creates AccountSharing Records 
     * Parameters: 
     * Returns:    void
     */
     @RemoteAction
    global static void createAccountSharingRecords(String expdate, List<String> userlist, List<String> accountIdList, String accSharingLevel, String opptySharingLevel, String caseSharingLevel) {
        List<AccountShare> accountSharingList = new List<AccountShare>();
        for(String accId : accountIdList) {
            for(String usrId: userlist) {
                accountSharingList.add(new AccountShare(
                                    UserOrGroupId = usrId,
                                    AccountId = accId,
                                    AccountAccessLevel = accSharingLevel,
                                    OpportunityAccessLevel = opptySharingLevel,
                                    CaseAccessLevel = caseSharingLevel,
                                    rowCause = 'Manual' ));

            }
        }
        Database.insert(accountSharingList);

        createShareLog(accountSharingList, expdate);
    }


    /* Method Name: createShareLog
     * Author Name: NSebastian@Deloitte
     * Description: Create records in Account Share log
     * Parameters: List<AccountShare>
     * Returns:    void
     */
    global static void createShareLog(List<AccountShare> accountSharingList, String expdate) {
        List<Account_Share_Log__c> loglist = new List<Account_Share_Log__c>();
        Date expirydate = Date.valueOf(expdate);
        System.debug('Check:expirydate'+expirydate);
        for(AccountShare accshare: accountSharingList) {
            loglist.add(new Account_Share_Log__c(AccountShareID__c = accshare.Id, Expiry_Date__c = expirydate,
                    Account__c = accshare.AccountId, User__c= accshare.UserOrGroupId));
        }
        System.debug('Check:loglist'+loglist);
        Database.insert(loglist);
    }

}