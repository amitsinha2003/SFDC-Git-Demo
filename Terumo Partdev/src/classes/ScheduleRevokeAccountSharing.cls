/************************************************************************
 * Name  : ScheduleRevokeAccountSharing
 * Author : Deloitte Consulting
 * Desc  : This scheduler is used ti run the batch to delete AccountShare records.
 *
 * Modification Log:
 * ----------------------------------------------------------------------
 * Developer                    Date            Description
 * ----------------------------------------------------------------------
 * NSebastian@Deloitte         11/12/2015             Original Version
 * 
 *************************************************************************/
global class ScheduleRevokeAccountSharing implements schedulable
{
    global void execute(SchedulableContext sc)
    {
    BatchRevokeAccountSharing batchRevoke = new BatchRevokeAccountSharing(); 
      database.executebatch(batchRevoke);
    }
}