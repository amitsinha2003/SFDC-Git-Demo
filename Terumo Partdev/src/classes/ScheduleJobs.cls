/************************************************************************
 * Name  : ScheduleJobs
 * Author : Deloitte Consulting
 * Desc  : Schedule all apex jobs   
 *
 * Modification Log:
 * ----------------------------------------------------------------------
 * Developer                    Date            Description
 * ----------------------------------------------------------------------
 * NSebastian@Deloitte         11/12/2015             Original Version
 * 
 *************************************************************************/
public with sharing class ScheduleJobs {
    
    //Variables

/* Method Name: ScheduleJobs
 * Author Name: NSebastian@Deloitte
 * Description: This is the Constructor
 * Parameters: 
 * Returns:    NA
 */
    public ScheduleJobs() {
    	accountShareDelete();
    }

    //methods


    /* Method Name: accountShareDelete
     * Author Name: NSebastian@Deloitte
     * Description: Schedule AccountShare delete on expiry
     * Parameters: 
     * Returns:    void
     */
    public void accountShareDelete() {
    	ScheduleRevokeAccountSharing schd = new ScheduleRevokeAccountSharing();
		String sch = '0 0 7 * * ?'; //Run daily at 12 AM
		System.Schedule('Revoke Account Shares expiring today', sch, schd);
    }
    

}